<!DOCTYPE html>
<jsp:include page="../frame/header.jsp"></jsp:include>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Snow Animation</title>
    <style>
        body {
            margin: 0;
            overflow: hidden;
        }

        .snowflake {
            position: absolute;
            background: #fff;
            width: 10px;
            height: 10px;
            border-radius: 50%;
            opacity: 0.8;
            pointer-events: none;
            animation: snowing linear infinite;
        }

        @keyframes snowing {
            0% {
                transform: translateY(0) rotate(0deg);
            }
            100% {
                transform: translateY(100vh) rotate(360deg);
            }
        }
    </style>
</head>
<body>
    <script>
        // Creating snowflakes dynamically
        function createSnowflake() {
            const snowflake = document.createElement('div');
            snowflake.className = 'snowflake';
            document.body.appendChild(snowflake);

            const startPosition = Math.random() * window.innerWidth;
            const animationDuration = Math.random() * 5 + 5;

            snowflake.style.left = startPosition + 'px';
            snowflake.style.animationDuration = animationDuration + 's';

            // Remove snowflake from DOM after animation
            snowflake.addEventListener('animationiteration', () => {
                snowflake.remove();
                createSnowflake();
            });
        }

        // Create initial set of snowflakes
        for (let i = 0; i < 50; i++) {
            createSnowflake();
        }
    </script>
</body>
</html>
