import os
import json
import functions_framework
import requests
from dotenv import load_dotenv

# Load environment variables from .env file (local development only)
if os.path.exists('.env'):
    load_dotenv()

api_key = os.environ.get('ANTHROPIC_API_KEY')
portfolio_secret = os.environ.get('PORTFOLIO_SECRET_KEY')

@functions_framework.http
def claude_proxy(request):
    """
    HTTP Cloud Function that serves as a proxy for the Anthropic Claude API.
    Args:
        request (flask.Request): The request object.
    Returns:
        The response from the Anthropic API.
    """
    # Allow all CORS (access from any origin)
    if request.method == 'OPTIONS':
        # Handle preflight requests
        headers = {
            'Access-Control-Allow-Origin': '*',
            'Access-Control-Allow-Methods': 'GET, POST, OPTIONS',
            'Access-Control-Allow-Headers': '*',
            'Access-Control-Max-Age': '3600'
        }
        return ('', 204, headers)

    # Only accept POST requests
    if request.method != 'POST':
        return (json.dumps({"error": "Only POST requests are supported"}), 405,
                {'Content-Type': 'application/json', 'Access-Control-Allow-Origin': '*'})

    try:
        # Get request data
        request_data = request.get_json()
        request_portfolio_secret = request_data.get('portfolio_secret')
        # if not request_portfolio_secret or request_portfolio_secret != portfolio_secret:
        #     return (json.dumps({"error": "Incorrect Portfolio Secret"}), 401,
        #            {'Content-Type': 'application/json', 'Access-Control-Allow-Origin': '*'})

        if 'portfolio_secret' in request_data:
            del request_data['portfolio_secret']
        # Verify API key
        if not api_key:
            return (json.dumps({"error": "API key not configured on server"}), 500,
                    {'Content-Type': 'application/json', 'Access-Control-Allow-Origin': '*'})

        # Set headers for Anthropic API
        headers = {
            "Content-Type": "application/json",
            "x-api-key": api_key,
            "anthropic-version": "2023-06-01"
        }

        # Forward request to Anthropic API
        response = requests.post(
            "https://api.anthropic.com/v1/messages",
            json=request_data,
            headers=headers
        )

        # Return the response
        return (response.text, response.status_code,
                {'Content-Type': 'application/json', 'Access-Control-Allow-Origin': '*'})

    except Exception as e:
        # Handle errors
        print(f"Error in claude_proxy: {str(e)}")
        return (json.dumps({"error": str(e)}), 500,
                {'Content-Type': 'application/json', 'Access-Control-Allow-Origin': '*'})