This repo attempts to reliably reproduce [CockroachDB issue 33342](https://github.com/cockroachdb/cockroach/issues/33342).

Using this repo requires Docker (with `docker-compose`) and bash.

To reproduce the error:

1. Clone this repo

    ```console
    $ git clone https://github.com/nexdrew/cockroach-33342-repro
    ```

2. Use Docker to run Cockroach

    ```console
    $ ./01-start-cockroach.sh
    ```

3. Load a minimal schema with minimal data

    ```console
    $ ./02-load-schema.sh
    ```

4. Run a query to produce an error

    ```console
    $ ./03-run-query.sh
    ```

5. Stop Cockroach

    ```console
    $ ./04-stop-cockroach.sh
    ```
