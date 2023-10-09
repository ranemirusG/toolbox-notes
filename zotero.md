# Zotero


# Delete all feeds
Tools > Developer > Run JavaScript

```
var feeds = Zotero.Feeds.getAll();
for (let feed of feeds) {
    await feed.eraseTx({ deleteItems: true });
}
```