{% if schema.kw_if %}
    {% set first_property =  schema.kw_if | get_first_property %}

    {% if schema.kw_then %}
        {%- filter md_heading(depth) -%}If (
            {% if first_property.kw_const %}
                {{- first_property.property_name | md_escape_for_table -}}
                {{- " = " -}}
                {{- first_property.kw_const.literal | python_to_json -}}
            {% endif %}
            {% if first_property.kw_pattern %}
                {{- first_property.property_name | md_escape_for_table -}}
                {{- " = " -}}
                {{- first_property.kw_pattern.literal | python_to_json -}}
            {% endif %}            
        ){%- endfilter -%}
        {% with schema=schema.kw_then, skip_headers=False, depth=depth %}
            {% include "content.md" %}
        {% endwith %}
    {% endif %}
{% endif %}