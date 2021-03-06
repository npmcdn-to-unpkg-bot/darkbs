h = void
setup = (h := )

setup preact?h || React?createElement ||
  (try require \preact .h) || (try require \react .createElement)

function join => []concat it .filter (-> it) .join ' '

viewports = <[xs sm md lg xl]>

function hidden-class(options || {})
  options = down: options if typeof options == \string
  join <[down up]>map ->
    "hidden-#that-#it" if options[it]

function class-name(options || {})
  return options if typeof options != \object

  join if typeof options.map == \function
    options.map class-name
  else [
    join (options.text || [])map -> "text-#it"
    \active if options.active
    hidden-class options.hidden
  ]

function drop(keys || [], props || {})
  {[k, props[k]] for k of props when !keys.some (== k)}

function wrap(keys, get-class)
  (props) ->
    element (drop [] ++ keys, props)
    <<< class-name: [get-class props; props.class-name]

function element({tag-name || \div}: props)
  h tag-name, (drop [\tagName] props)
  <<< class-name: class-name props.class-name

``
export {join, wrap, viewports, element, className}
export default setup``
