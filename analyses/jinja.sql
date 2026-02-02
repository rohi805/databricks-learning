{%- set apples = ['red','blue','green','yellow','white'] -%}

{%for i in apples%}
   {%if i != 'red'%}
      {{i}}
    {%else%}
        I hate {{i}}
    {%endif%}    

{%endfor%}    