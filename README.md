Dehydrated Docker Image
=======================

```
docker run -it --rm --name dehydrated -e CF_DEBUG=true -e CF_EMAIL -e CF_KEY -v /etc/dehydrated:/data halkeye/dehydrated -c
```
