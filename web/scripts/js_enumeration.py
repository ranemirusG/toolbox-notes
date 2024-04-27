import requests
from bs4 import BeautifulSoup
import os

# Get URL from user input
url = input("Enter the URL of the webpage: ")

# Make a request to the URL
response = requests.get(url)

# Check if request was successful
if response.status_code == 200:
    # Parse the HTML content
    soup = BeautifulSoup(response.text, 'html.parser')

    # Extracting <script> tags
    script_tags = soup.find_all('script')

    # Extracting src attributes from <script> tags
    script_sources = [tag.get('src') for tag in script_tags if tag.get('src')]

    # Count inline scripts
    inline_scripts_count = sum(1 for tag in script_tags if not tag.get('src'))

    # Get filename from URL and create markdown file
    url_parts = url.split("/")
    domain = url_parts[2]
    filename = "_".join(domain.split(".") + url_parts[3:]) + ".md"

    with open(filename, "w") as file:
        file.write("# JavaScript Files\n")
        if script_sources:
            for src in script_sources:
                file.write(f"- {src}\n")
        else:
            file.write("No external JavaScript files found.\n")

        file.write("\n# Inline Scripts\n")
        if script_tags:
            for tag in script_tags:
                if not tag.get('src'):
                    file.write(f"## Line {tag.sourceline}:\n")
                    file.write("```html\n")
                    file.write(str(tag).strip() + "\n")
                    file.write("```\n")
        else:
            file.write("No inline scripts found.\n")

    # Print brief summary
    print(f"Found {inline_scripts_count} inline scripts and {len(script_sources)} external script(s).")
    print(f"Output saved to {filename}")
else:
    print("Failed to retrieve the webpage. Please check the URL and try again.")
