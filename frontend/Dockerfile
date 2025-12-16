# ---------- Build stage ----------
FROM ghcr.io/cirruslabs/flutter:3.16.5 AS build

WORKDIR /app

COPY pubspec.yaml .
RUN flutter pub get

COPY . .
RUN flutter build web

# ---------- Serve stage ----------
FROM nginx:alpine

COPY --from=build /app/build/web /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
