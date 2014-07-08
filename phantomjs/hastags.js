try {
  var json_input = JSON.parse(phantom.args[0]); 
  var url = json_input["url"];
  var page = require('webpage').create();
  if (url) {
    // open the page
    page.open(url, function (status) {
      if (status !== 'success') {
        console.log('Unable to load the address!');
      } else {
        // wait for the page to fully execute ajax or whatever
        window.setTimeout(function () {
          var selectors = json_input["selectors"];
          var result = {};
          if (selectors) {
            // iterate selectors to check
            selectors.forEach(function(selector) {
              result[selector] = page.evaluate(function(s) {
                // check for existence
                return (document.querySelector(s) != null);
              }, selector);
            });
          }
          console.log(JSON.stringify(result));
          phantom.exit();
        }, 4000);
      }
    }); 
  } else {
    phantom.exit();                     
  }
} catch(err) {
  console.log(err); 
  phantom.exit();
}