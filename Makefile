all:
    # install rays_pycocotools locally
	python setup.py build_ext --inplace
	rm -rf build

install:
	# install rays_pycocotools to the Python site-packages
	python setup.py build_ext install
	rm -rf build