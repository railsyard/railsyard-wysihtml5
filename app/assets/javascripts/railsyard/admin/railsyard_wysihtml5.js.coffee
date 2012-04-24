#= require wysihtml5
#= require wysihtml5_parser_rules/advanced

$ ->

  generateWysihtml5 = (dom) ->
    $(".wysihtml5-wrapper", dom).each ->
      return if $(this).parents(".nested_form_blueprint").length > 0
      $this = $(this)
      toolbar = $this.find(".wysihtml5-toolbar").get(0)
      textarea = $this.find("textarea").get(0)
      new wysihtml5.Editor(textarea, toolbar: toolbar, parserRules: wysihtml5ParserRules)

      setTimeout(
        -> $(textarea).addClass("raw-html")
        200
      )

  generateWysihtml5()

  $("form").bind "nested:fieldAdded", (opts) -> generateWysihtml5(opts.field)
