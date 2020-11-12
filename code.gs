function doGet(request){
  // Open Google Sheet using ID
//  var sheet = SpreadsheetApp.openById("1qIzjugiCuLl-p_1QO7ggawh8SpvluZA-11ConOC9zHs");
  
  var sheet = SpreadsheetApp.openByUrl("https://docs.google.com/spreadsheets/d/1qIzjugiCuLl-p_1QO7ggawh8SpvluZA-11ConOC9zHs/");
  // Get all values in active sheet
  var values = sheet.getActiveSheet().getDataRange().getValues();
  var data = [];

  // Iterate values in descending order 
  for (var i = values.length - 1; i >= 0; i--) {

    // Get each row
    var row = values[i];

    // Create object
    var vocabulary = {};

    vocabulary['kannji'] = row[0];
    vocabulary['gojuuon'] = row[1];
    vocabulary['imi'] = row[2];
    vocabulary['sentence'] = row[3];

    // Push each row object in data
    data.push(vocabulary);
  }

  // Return result
  return ContentService
  .createTextOutput(JSON.stringify(data))
  .setMimeType(ContentService.MimeType.JSON);
}