function quotem#github#get_url()
  return trim(system('gh browse --no-browser ' .. expand('%')))
endfunction
