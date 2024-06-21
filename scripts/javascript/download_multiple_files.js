// Function to download a file given its URL
function download(url, filename) {
    fetch(url)
        .then(response => response.blob())
        .then(blob => {
            const a = document.createElement('a');
            const blobUrl = window.URL.createObjectURL(blob);
            a.href = blobUrl;
            a.download = filename;
            document.body.appendChild(a);
            a.click();
            setTimeout(() => {
                window.URL.revokeObjectURL(blobUrl);
                document.body.removeChild(a);
            }, 0);
        })
        .catch(console.error);
}

// Select all anchor tags with href ending in .pdf
const pdfLinks = document.querySelectorAll('a[href$=".pdf"]');

// Iterate through the selected elements
pdfLinks.forEach(link => {
    const url = link.href;  // Get the href attribute of the anchor tag
    const filename = url.split('/').pop();  // Use the last part of the URL as the filename

    // Trigger the download
    download(url, filename);
});
