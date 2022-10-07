docker build ./ -t imageproc
docker run -dit --name imageproc \
		   --mount type=bind,src=/Users/akagawaoozora/Desktop/Github/imageproc_docker/videos,dst=/videos \
		   --mount type=bind,src=/Users/akagawaoozora/Desktop/Github/imageproc_docker/images,dst=/images \
		   imageproc
