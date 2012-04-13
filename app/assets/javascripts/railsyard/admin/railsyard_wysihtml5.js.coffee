#= require wysihtml5
#= require wysihtml5_parser_rules/advanced

$ ->
  $(".wysihtml5-wrapper").each ->
    $this = $(this)
    toolbar = $this.find(".wysihtml5-toolbar").get(0)
    textarea = $this.find("textarea").get(0)
    new wysihtml5.Editor(textarea, toolbar: toolbar, parserRules: wysihtml5ParserRules)

    setTimeout(
      -> $(textarea).addClass("raw-html")
      200
    )
