-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "username" TEXT,
    "password" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "photo" TEXT,
    "isAdmin" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Capsule" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "matematicas" INTEGER NOT NULL,
    "lengua" INTEGER NOT NULL,
    "ingles" INTEGER NOT NULL,
    "fisica" INTEGER NOT NULL,
    "naturales" INTEGER NOT NULL,
    "sociales" INTEGER NOT NULL,
    "educacionFisica" INTEGER NOT NULL,
    "dibujoTecnico" INTEGER NOT NULL,
    "comentarios" TEXT,

    CONSTRAINT "Capsule_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserCapsule" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "capsuleId" TEXT NOT NULL,

    CONSTRAINT "UserCapsule_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_username_key" ON "User"("username");

-- AddForeignKey
ALTER TABLE "Capsule" ADD CONSTRAINT "Capsule_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserCapsule" ADD CONSTRAINT "UserCapsule_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserCapsule" ADD CONSTRAINT "UserCapsule_capsuleId_fkey" FOREIGN KEY ("capsuleId") REFERENCES "Capsule"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
