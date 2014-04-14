# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$( ->
  ready = ->    
    for familyListingElement in $('.family-listing')
      familyListing = $(familyListingElement)
      familyListing.data('html', familyListing.html().replace(/\r*\n*/ig, ''))

    $(".family-search").bind 'keydown', (e) ->
      for familyListingElement in $('.family-listing')
        familyListing = $(familyListingElement)
        familyListing.html(familyListing.data('html'))

    $(".family-search").bind 'keyup', (e) ->
      search = e.target.value
      if !search.length
        $('.family-listing').removeClass('no-search')
      else
        for familyListingElement in $('.family-listing')
          familyListing = $(familyListingElement)
          html = familyListing.data('html')
          if html.toLowerCase().indexOf(search.toLowerCase()) > -1
            familyListing.removeClass('no-search')
            regex = new RegExp("(#{search})", 'ig')
            familyListing.html(html.replace(regex, '<span class="highlight">$1</span>'))
          else
            familyListing.addClass('no-search')
        bindListings()
        
    bindListings = ->      
      $('.family-listing').bind 'click', (e) ->
        window.location.href = '/families/' + $(e.target).data('family')
      
    bindListings()

  $(document).ready(ready)
  $(document).on('page:load', ready)

)


