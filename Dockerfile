# Multi-stage build for Flutter web app
FROM dart:stable AS build

# Set working directory
WORKDIR /app

# Copy pubspec files
COPY pubspec.* ./

# Get dependencies
RUN dart pub get

# Copy source code
COPY . .

# Build the Flutter web app
RUN dart pub global activate webdev
RUN flutter build web --release --web-renderer canvaskit

# Production stage with nginx
FROM nginx:alpine

# Copy the built web files to nginx html directory
COPY --from=build /app/build/web /usr/share/nginx/html

# Copy nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port (Cloud Run uses PORT environment variable)
EXPOSE 8080

# Start nginx
CMD ["nginx", "-g", "daemon off;"]