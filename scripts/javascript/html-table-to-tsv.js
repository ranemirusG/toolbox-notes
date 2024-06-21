/*
*
*	Download an html table as a .tsv file
*
*/

// Select the table element containing the data
const table = document.querySelector('.example');

// Select all rows from the table
const rows = table.querySelectorAll('tr');

// Initialize markdown table string
let tsvData = '';

// Iterate over rows
rows.forEach(row => {
    // Select all cells in the row
    const cells = row.querySelectorAll('td, th');

    // Initialize row string
    let rowString = '';

    // Iterate over cells
    cells.forEach(cell => {
        // Append cell content to row string, separating with tabs
        rowString += cell.innerText + '\t';
    });

    // Trim trailing tab and add newline character
    rowString = rowString.trim() + '\n';

    // Append row string to markdown table
    tsvData += rowString;
});

// Create a Blob containing the markdown table data
const blob = new Blob([tsvData], { type: 'text/plain' });

// Create a download link
const downloadLink = document.createElement('a');
downloadLink.href = URL.createObjectURL(blob);
downloadLink.download = 'table.tsv'; // Change the filename if needed

// Simulate click on the download link
downloadLink.click();




/*

// Another example using xpath approach



// Function to traverse the table and extract data
function extractTableData(xpath) {
    const rows = document.evaluate(xpath, document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    let tsvData = '';

    for (let i = 0; i < rows.snapshotLength; i++) {
        const row = rows.snapshotItem(i);
        const cells = row.querySelectorAll('td');

        // Extract text content from each cell and add to TSV data
        cells.forEach((cell, index) => {
            // Append cell content to TSV data string, separating with tabs
            tsvData += cell.innerText.trim();

            // Add tab separator unless it's the last cell in the row
            if (index < cells.length - 1) {
                tsvData += '\t';
            }
        });

        // Add newline character after each row
        tsvData += '\n';
    }

    return tsvData;
}

// Define the XPath for the rows in the table
const xpath = "//table/tbody/tr";

// Extract data using XPath
const tsvData = extractTableData(xpath);

// Create a Blob containing the TSV data
const blob = new Blob([tsvData], { type: 'text/plain' });

// Create a download link
const downloadLink = document.createElement('a');
downloadLink.href = URL.createObjectURL(blob);
downloadLink.download = 'table_data.tsv'; // Set filename for TSV file

// Simulate click on the download link
downloadLink.click();
*/
