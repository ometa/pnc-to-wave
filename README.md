# pnc-to-wave

Ruby tools to munge exported PNC transactions into a format
easily importable by Wave Accounting.

Right now all this does is negate the Amount column if the Transaction Type is a
debit, and dumps the output to stdout in the format Wave Accounting expects.

## Usage

```bash
./bin/pnc-to-wave /path/to/your/pnc-transaction-export.csv
```

### Convenience Function

```bash
for i in $(seq 1 12); do ./bin/pnc-to-wave ~/Downloads/$i.csv > ~/Downloads/a_${i}.csv; done
```
