# 使い方

1. `docker build ./ -t imageproc`
2. `docker run --rm -dit --mount type=bind.src=動画をおいておくフォルダ,dst=/videos --mount type=bind,src=画像をおきたいフォルダ,dst=/images imageproc`
