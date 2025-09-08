{% snapshot customer_snapshot %}
    {{
        config(
            target_schema="snapshots",
            unique_key="CustomerID",
            strategy="check",
            check_cols=["CustomerName", "Segment", "Country", "State"],
        )
    }}

    select customerid, customername, segment, country, state
    from {{ source("raw", "customers") }}
{% endsnapshot %}
