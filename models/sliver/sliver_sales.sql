with sales as 
(
    select sales_id,product_sk,customer_sk,{{multiply('unit_price','quantity')}} as calculated_amount,gross_amount,payment_method
    from {{ref("bronze_sales")}}
),
product as
(
    select * from {{ref("bronze_product")}}
),
customer as 
(
    select * from {{ref("bronze_customer")}}
),
joined_query as
(
    select 
    sales.sales_id,
    sales.calculated_amount,
    sales.gross_amount,
    sales.payment_method,
    product.category,
    customer.gender
    from sales
    join product on sales.product_sk = product.product_sk
    join customer on sales.customer_sk = customer.customer_sk
)

select category,gender,round(sum(gross_amount),3) as total_sales from joined_query group by category,gender
order by total_sales desc 