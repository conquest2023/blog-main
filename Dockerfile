# 1. base 이미지 설정 (최적화된 버전 사용)
FROM node:20-alpine AS base

# 2. 작업 디렉토리 생성
WORKDIR /app

# 3. 종속성 설치를 위한 package.json, lock 파일 복사
COPY package.json package-lock.json* ./

# 4. 의존성 설치 (devDependencies 포함)
RUN npm install

# 5. 프로젝트 전체 복사
COPY . .

# 6. Next.js 앱 빌드
RUN npm run build

# 7. 실행용 경량 이미지 사용
FROM node:20-alpine AS runner

WORKDIR /app

# 8. 필요한 파일만 복사
COPY --from=base /app/public ./public
COPY --from=base /app/.next ./.next
COPY --from=base /app/node_modules ./node_modules
COPY --from=base /app/package.json ./package.json
COPY --from=base /app/data ./data
# 9. 포트 설정
EXPOSE 3000

# 10. 앱 실행 (Next.js standalone 서버)
CMD ["npm", "start"]
