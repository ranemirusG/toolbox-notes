import sqlite3
from PIL import Image
from io import BytesIO

# Replace with your SQLite database file path
sqlite_file = r"path/to/database"

# Connect to SQLite database
conn = sqlite3.connect(sqlite_file)
cursor = conn.cursor()

try:
    # Retrieve BLOB data from the image table
    cursor.execute("SELECT png FROM image LIMIT 1")
    row = cursor.fetchone()
    
    if row:
        # Extract BLOB data
        image_blob = row[0]

        # Convert BLOB data to image
        img = Image.open(BytesIO(image_blob))
        
        # Save the image to file
        img.save("extracted_image.png")
        print("Image extracted and saved successfully.")

except sqlite3.Error as e:
    print("SQLite error:", e)

finally:
    # Close connections
    cursor.close()
    conn.close()
