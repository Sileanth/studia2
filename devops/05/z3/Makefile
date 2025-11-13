all: app

app: app.cpp
	g++ $(HOST_COMPILER_FLAGS) app.cpp -o app

install: app
	install app /usr/local/bin/my_app

clean:
	rm -f app
