
# Presentation service

Scientific, multi-file Markdown presentations.

Incorporating [Quarto](https://quarto.org/) (and under-the-hood [Reveal.js](https://revealjs.com/))
to automatically generate an index from Markdown slides provided in `Slides/`. Slides are attached
like a volume so any changes are immediately reflected on the server with the `autoindex` container.

Supports the [service autoproxy](https://github.com/QSmally/Service-Autoproxy), or standalone usage
with `docker-compose.yml`.

## Usage

```bash
$ docker compose up [--detached --build --remove-orphans]
```

## Notes

* Slides are sorted by their name, so a `00-` prefix convention may be necessary;
* Container `autoindex` is necessary to automatically generate an index on start/update.
