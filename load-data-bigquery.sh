BUCKET_NAME="upload-bigquery"
TABLE_NAMES="test_activity test_guild test_party test_trade test_payment train_activity train_guild train_label train_party train_payment train_trade"

for TABLE in $TABLE_NAMES; do
    bq --location=US load --autodetect --skip_leading_rows=1 --source_format=CSV "nc_new.${TABLE}" "gs://${BUCKET_NAME}/${TABLE}.csv"
done
