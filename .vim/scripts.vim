if did_filetype()    " filetype already set..
  finish     " ..don't do these checks
endif
if getline(1) =~ '^#!.* \<ruby\>'
  setfiletype ruby
elseif getline(1) =~ '^#!.* \<sh\>'
  setfiletype sh
elseif getline(1) =~ '^#!.*\<bash\>'
  setfiletype sh
endif
