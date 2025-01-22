/* le fichier stg_xxx.sql sert à transformer les données de la table brute */

with source as (
    select * from {{ source('my_dbt_db', 'raw_customers') }}  /* (le nom de la database, le nom de la table) */
),
renamed as (
    select
        id as customer_id,  /* changement nom des colonnes ==> vérifier sur table raw le nom des colonnes à renommer */
        name as customer_name  /* toujours penser à la clé primaire */
    from source
)
select * from renamed