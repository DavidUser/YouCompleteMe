sudo zypper install libclang llvm-clang
cd /usr/lib64 && \
	sudo ln libclang.so.3.5 libclang.so

cd ~ && \
	mkdir ycm_build && \
	cd ycm_build && \
	make -G "Unix Makefiles" -USE_SYSTEM_LIBCLANG=ON -DEXTERNAL_LIBCLANG_PATH=/usr/lib64/libclang.so.3.5 . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp && \
	 cmake --build . --target ycm_core

# .ycm_extra_conf.py configurado com os includes do gcc /usr/include /usr/include/c++/...
echo "let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'" >> ~/.vimrc
ln -s third_party/ycmd/cpp
