FROM python:3.7-alpine

RUN apk add --update \
    bash \
    curl \
    openssl \
    git \
    && rm -rf /var/cache/apk/*


RUN git clone https://github.com/lukas2511/dehydrated.git /dehydrated
RUN git clone https://github.com/kappataumu/letsencrypt-cloudflare-hook /dehydrated/hooks/cloudflare
RUN pip install -r /dehydrated/hooks/cloudflare/requirements.txt
ADD config /dehydrated/config

ENTRYPOINT ["bash", "/dehydrated/dehydrated", "-f", "/dehydrated/config"]
