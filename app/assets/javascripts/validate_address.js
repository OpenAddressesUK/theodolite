function validateAddress(url, exists, attribution, reason, callback) {

  $.getJSON(url+".json").done(function( data ) {      
      derivations = data['address']['provenance']['activity']['derived_from']
      for (derived in derivations) {
          url = derivations[derived]['urls'][0]          
          if (url.indexOf("ernest") > 0) {
              validation_url = url.replace("http:", "https:") + "/validations";
              data = {
                  exists: exists,
                  attribution: attribution,
                  reason: reason
              };
              $.ajax(validation_url, {
                  type: "POST",
                  contentType : 'application/json',
                  data: JSON.stringify(data),
                  success: function() {
                    callback(true);
                  },
                  error: function() {
                    callback(false);
                  }
              });
          }
      }
  });

  
}