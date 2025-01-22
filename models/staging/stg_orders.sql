/* le fichier stg_xxx.sql sert à transformer les données de la table brute */

with source as (
    select * from {{ source('my_dbt_db', 'raw_orders') }}  /* (le nom de la database, le nom de la table) */
),
renamed as (
    select
        id as orders_id,  /* changement nom des colonnes ==> vérifier sur table raw le nom des colonnes à renommer */
        customer as customer_id,  /* toujours penser à la clé primaire */
        ordered_at as orders_ordered_at,
        store_id as orders_store_id
    from source
)
select * from renamed