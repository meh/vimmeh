import re

def prepare(string):
  return [part for part in re.split('\s+', string) if part]

def FlagsForFile(filename, **kwargs):
  flags    = []
  data     = kwargs['client_data']
  filetype = data['&filetype']

  if filetype == 'c':
    flags = ['-xc', '-Wall', '-Wextra', '-pipe'] + prepare(data['g:syntastic_c_compiler_options'])
  elif filetype == 'cpp':
    flags = ['-xc++', '-Wall', '-Wextra', '-pipe'] + prepare(data['g:syntastic_cpp_compiler_options'])
  elif filetype == 'cpp11':
    flags = ['-xc++', '-std=c++11', '-Wall', '-Wextra', '-pipe'] + prepare(data['g:syntastic_cpp_compiler_options'])

  return {
    'flags':    flags,
    'do_cache': True
  }
