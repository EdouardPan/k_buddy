import 'algoliasearch';
import  autocomplete  from 'autocomplete.js';

// Without '' or {}, it is a module that we are importing.

export function algoliaAutocomplete() {
  var client = algoliasearch('7K6EPIOZJD', '43c96c2020a8f0a9229a8ab31cd59e19');
  var index = client.initIndex('Drug');
  console.log(index);
  autocomplete('#search-input', { hint: false }, [
    {
      source: autocomplete.sources.hits(index, { hitsPerPage: 5 }),
      displayKey: 'name',
      templates: {
        suggestion: function(suggestion) {
          return suggestion._highlightResult.name.value;
        }
      }
    }
  ]).on('autocomplete:selected', function(event, suggestion, dataset) {
    console.log(suggestion, dataset);
  });
}



