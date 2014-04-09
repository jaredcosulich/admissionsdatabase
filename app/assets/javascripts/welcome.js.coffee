# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$( ->
  ready = ->

    $(".family-search").bind 'keydown', (e) ->
      familyListings = $('.family-listings')
      html = familyListings.html()
      html = html.replace(/\r*\n*/ig, '')
      html = html.replace(/\<span class=\"highlight\"\>([^<]*)\<\/span\>/ig, '$1')
      familyListings.html(html)

    $(".family-search").bind 'keyup', (e) ->
      search = e.target.value
      if !search.length
        $('.family-listing').removeClass('no-search')
      else
        for familyEntryElement in $('.family-listing')
          familyEntry = $(familyEntryElement)
          if familyEntry.html().indexOf(search) > -1
            familyEntry.removeClass('no-search')
            regex = new RegExp(search, 'g')
            familyEntry.html(familyEntry.html().replace(regex, '<span class="highlight">' + search + '</span>'))
          else
            familyEntry.addClass('no-search')
  
  
  $(document).ready(ready)
  $(document).on('page:load', ready)

)


