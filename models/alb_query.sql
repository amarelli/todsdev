{{
  config(
    materialized='view'
  )
}}
with alb1 as (

    select * from {{ ref('stg_prova1') }}
),
alb3 as (
       select * from {{ ref('stg_alb_country_codes') }}
),

alb2 as (
    select
      
          store_cd as codice
         ,store_id as ident
 
    from alb1
    order by 1
),
alb as (
    select
         alb2.codice
		,alb2.ident
    from alb2
    
)
select * from alb 



