#!/usr/bin/env python3

import subprocess
import sys

def run_command(command):
    try:
        result = subprocess.run(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True, check=True)
        return result.stdout.strip()
    except subprocess.CalledProcessError as e:
        print(f"Error executing command: {e}")
        sys.exit(1)

def update_readme():
    readme_path = "./README.md"
    reference_marker = "##"

    # Get the list of repository content excluding .gitignore and .git
    repo_content = run_command(["git", "ls-files"])

    # Read the existing content of README.md
    with open(readme_path, "r") as readme_file:
        readme_lines = readme_file.readlines()

    # Find the index of the last occurrence of a line starting with "##"
    reference_indices = [i for i, line in enumerate(readme_lines) if line.startswith(reference_marker)]
    if reference_indices:
        reference_index = reference_indices[-1]
        # Append the directory listing right after the last occurrence of "##"
        readme_lines.insert(reference_index + 1, f"\n{repo_content}\n")

        # Write the updated content back to README.md
        with open(readme_path, "w") as readme_file:
            readme_file.writelines(readme_lines)
    else:
        print("Reference line not found in README.md")
        sys.exit(1)

if __name__ == "__main__":
    update_readme()
