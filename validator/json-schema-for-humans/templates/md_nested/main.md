{% set depth = 0 %}
{{ schema.keywords.get("title").literal | default("Schema Docs") }}
{% set contentBase %}
{% with schema=schema, skip_headers=False, depth=depth %}
    
        {# 
            content is a template and not a macro in md
                because macro parameters are not through context
                when rendering a template from the macro and it caused
                serious problems when using recursive calls
            mandatory context parameters: 
            schema
        #}
        {# context parameters default values #}
        {% set skip_headers = skip_headers or False %}
        {% set depth = depth or 0 %}
        {# end context parameters #}

        {% set keys = schema.keywords %}
        {%- if not skip_headers %}

        {% if schema.title and schema.title | length > 0 %}
        **Title:** {{ schema.title }}
        {% endif %}
        {% endif %}


{% endwith %}
{% endset %}


{{ contentBase }}

----------------------------------------------------------------------------------------------------------------------------
{% if config.with_footer -%}
Generated using [json-schema-for-humans](https://github.com/coveooss/json-schema-for-humans){% if config.footer_show_time %} on {{ get_local_time() }}{% endif %}
{%- endif -%}