NAME=puppetdb_node_lister
VERSION=0.1

.PHONY: package

package:
	rm -rf $(NAME)-$(VERSION)-1.x86_64.rpm
	bundle exec fpm \
		-s dir \
		-t rpm \
		-n $(NAME) \
		-v $(VERSION) \
		--rpm-os linux \
		--exclude ".git" \
		--exclude "vendor/bundle" \
		--exclude ".gitignore" \
		--exclude ".ruby-version" \
		--exclude ".bundle" \
		-d 'ruby > 1.9.3' \
		-d ruby-devel \
		--prefix /opt/$(NAME) \
		.
