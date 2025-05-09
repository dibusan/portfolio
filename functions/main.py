# main.py

import os
import json
import requests
from firebase_functions import https_fn, options
from firebase_admin import initialize_app
from dotenv import load_dotenv

# Load environment variables from .env file (local development only)
if os.path.exists('.env'):
    load_dotenv()

# For Firebase Functions deployed to the cloud
# The config is stored in a special environment variable
firebase_config_env = os.environ.get('FIREBASE_CONFIG')

if firebase_config_env:
    firebase_config = json.loads(firebase_config_env)
    # Access config values
    api_key = firebase_config.get('anthropic', {}).get('api_key')
    portfolio_secret = firebase_config.get('portfolio', {}).get('secret_key')
else:
    # Fallback for local development
    api_key = os.environ.get('ANTHROPIC_API_KEY')
    portfolio_secret = os.environ.get('PORTFOLIO_SECRET_KEY')

# Initialize Firebase app
initialize_app()

# Configure CORS options
cors_opts = options.CorsOptions(
    cors_origins=[
        "http://localhost:59096",  # Your Flutter web app origin
        "http://localhost:3000",   # Alternative local dev server
        "https://your-production-domain.com"  # Add your production domain when ready
    ],
    cors_methods=["GET", "POST", "OPTIONS"],
    # allow_headers=["Content-Type", "Authorization", "x-api-key"]
)

@https_fn.on_request(
    cors=cors_opts
)
def claude_proxy(req: https_fn.Request) -> https_fn.Response:
    """
    Firebase Cloud Function that serves as a proxy for the Anthropic Claude API.
    This function handles CORS and forwards requests to the Anthropic API.
    """
    # Special handling for OPTIONS requests (CORS preflight)
    if req.method == "OPTIONS":
        # Return 204 No Content for preflight request
        return https_fn.Response(
            "",
            status=204,
            headers={
                "Access-Control-Allow-Origin": "*",  # Or your specific origins
                "Access-Control-Allow-Methods": "GET, POST, OPTIONS",
                "Access-Control-Allow-Headers": "Content-Type, Authorization, x-api-key",
                "Access-Control-Max-Age": "3600"
            }
        )

    # For non-OPTIONS requests, proceed as before...
    elif req.method != "POST":
        return https_fn.Response(
            json.dumps({"error": "Only POST requests are supported"}),
            status=405,
            headers={"Content-Type": "application/json"}
        )

    request_portfolio_secret = req.get('portfolio_secret')
    if (not request_portfolio_secret) or (request_portfolio_secret != portfolio_secret):
        return https_fn.Response(
            json.dumps({"error": "Incorrect Portfolio Secret. Eriel did this."}),
            status=401,
            headers={"Content-Type": "application/json"}
        )

    try:
        # Get the request body
        request_data = req.get_json()

        if not api_key:
            return https_fn.Response(
                json.dumps({"error": "API key not configured on server"}),
                status=500,
                headers={"Content-Type": "application/json"}
            )

        # Prepare headers for Anthropic API
        headers = {
            "Content-Type": "application/json",
            "x-api-key": api_key,
            "anthropic-version": "2023-06-01"
        }

        # Forward the request to Anthropic API
        response = requests.post(
            "https://api.anthropic.com/v1/messages",
            json=request_data,
            headers=headers
        )

        # Return the Anthropic API response
        return https_fn.Response(
            response.text,
            status=response.status_code,
            headers={"Content-Type": "application/json"}
        )

    except Exception as e:
        # Log the error (will appear in Firebase Functions logs)
        print(f"Error in claude_proxy: {str(e)}")

        # Return error response
        return https_fn.Response(
            json.dumps({"error": str(e)}),
            status=500,
            headers={"Content-Type": "application/json"}
        )