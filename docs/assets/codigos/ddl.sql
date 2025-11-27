-- ============================================
-- DDL - Modelo Físico do Banco de Dados
-- Sistema: Sexto Andar
-- Data: 27/11/2025
-- ============================================

-- ============================================
-- ENUMS (Tipos Customizados)
-- ============================================

CREATE TYPE public.roleenum AS ENUM (
    'USER',
    'PROPERTY_OWNER',
    'ADMIN'
);

CREATE TYPE public.salestypeenum AS ENUM (
    'RENT',
    'SALE'
);

CREATE TYPE public.propertytypeenum AS ENUM (
    'APARTMENT',
    'HOUSE'
);

CREATE TYPE public.proposalstatusenum AS ENUM (
    'PENDING',
    'ACCEPTED',
    'REJECTED',
    'WITHDRAWN'
);

-- ============================================
-- TABELAS
-- ============================================

-- Tabela: accounts
-- Descrição: Armazena os usuários do sistema (clientes, proprietários e admins)
CREATE TABLE public.accounts (
    id uuid NOT NULL,
    username character varying(50) NOT NULL,
    "fullName" character varying(100) NOT NULL,
    "phoneNumber" character varying(20),
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    role public.roleenum NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    profile_picture bytea,
    profile_picture_content_type character varying(50),
    CONSTRAINT accounts_pkey PRIMARY KEY (id)
);

-- Tabela: addresses
-- Descrição: Armazena os endereços das propriedades
CREATE TABLE public.addresses (
    id uuid NOT NULL,
    street character varying(200) NOT NULL,
    number character varying(20) NOT NULL,
    city character varying(100) NOT NULL,
    postal_code character varying(20) NOT NULL,
    country character varying(100) NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    CONSTRAINT addresses_pkey PRIMARY KEY (id)
);

-- Tabela: properties
-- Descrição: Armazena as propriedades cadastradas (casas/apartamentos)
CREATE TABLE public.properties (
    id uuid NOT NULL,
    "idPropertyOwner" uuid NOT NULL,
    address_id uuid NOT NULL,
    "propertySize" numeric(10,2) NOT NULL,
    description character varying(1000) NOT NULL,
    "propertyValue" numeric(10,2) NOT NULL,
    "publishDate" timestamp without time zone NOT NULL,
    "condominiumFee" numeric(10,2),
    "commonArea" boolean NOT NULL,
    floor integer,
    "isPetAllowed" boolean NOT NULL,
    "landPrice" numeric(10,2),
    "isSingleHouse" boolean,
    "salesType" public.salestypeenum NOT NULL,
    "propertyType" public.propertytypeenum NOT NULL,
    is_active boolean NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    CONSTRAINT properties_pkey PRIMARY KEY (id),
    CONSTRAINT properties_address_id_fkey FOREIGN KEY (address_id) 
        REFERENCES public.addresses(id)
);

-- Tabela: property_images
-- Descrição: Armazena as imagens das propriedades
CREATE TABLE public.property_images (
    id uuid NOT NULL,
    property_id uuid NOT NULL,
    image_data bytea NOT NULL,
    content_type character varying(50) NOT NULL,
    file_size integer NOT NULL,
    display_order integer NOT NULL,
    is_primary boolean NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    CONSTRAINT property_images_pkey PRIMARY KEY (id),
    CONSTRAINT property_images_property_id_fkey FOREIGN KEY (property_id) 
        REFERENCES public.properties(id) ON DELETE CASCADE
);

-- Tabela: favorites
-- Descrição: Armazena os favoritos dos usuários (propriedades salvas)
CREATE TABLE public.favorites (
    id uuid NOT NULL,
    "idUser" uuid NOT NULL,
    "idProperty" uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone DEFAULT now(),
    CONSTRAINT favorites_pkey PRIMARY KEY (id),
    CONSTRAINT uq_user_property_favorite UNIQUE ("idUser", "idProperty"),
    CONSTRAINT "favorites_idProperty_fkey" FOREIGN KEY ("idProperty") 
        REFERENCES public.properties(id) ON DELETE CASCADE
);

-- Tabela: proposals
-- Descrição: Armazena as propostas de aluguel/compra feitas pelos usuários
CREATE TABLE public.proposals (
    id uuid NOT NULL,
    "idProperty" uuid NOT NULL,
    "idUser" uuid NOT NULL,
    "proposalDate" timestamp with time zone NOT NULL,
    "proposalValue" numeric(10,2) NOT NULL,
    status public.proposalstatusenum NOT NULL,
    message character varying(1000),
    response_message character varying(500),
    response_date timestamp with time zone,
    expires_at timestamp with time zone,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    CONSTRAINT proposals_pkey PRIMARY KEY (id),
    CONSTRAINT "proposals_idProperty_fkey" FOREIGN KEY ("idProperty") 
        REFERENCES public.properties(id)
);

-- Tabela: visits
-- Descrição: Armazena os agendamentos de visitas às propriedades
CREATE TABLE public.visits (
    id uuid NOT NULL,
    "idProperty" uuid NOT NULL,
    "idUser" uuid NOT NULL,
    "visitDate" timestamp with time zone NOT NULL,
    "isVisitCompleted" boolean NOT NULL,
    notes character varying(500),
    cancelled boolean NOT NULL,
    cancellation_reason character varying(200),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    CONSTRAINT visits_pkey PRIMARY KEY (id),
    CONSTRAINT "visits_idProperty_fkey" FOREIGN KEY ("idProperty") 
        REFERENCES public.properties(id)
);

-- ============================================
-- ÍNDICES
-- ============================================

-- Índices da tabela accounts
CREATE UNIQUE INDEX ix_accounts_email ON public.accounts USING btree (email);
CREATE UNIQUE INDEX ix_accounts_username ON public.accounts USING btree (username);
CREATE INDEX ix_accounts_role ON public.accounts USING btree (role);

-- Índices da tabela properties
CREATE INDEX "ix_properties_idPropertyOwner" ON public.properties USING btree ("idPropertyOwner");

-- Índices da tabela property_images
CREATE INDEX ix_property_images_property_id ON public.property_images USING btree (property_id);

-- Índices da tabela favorites
CREATE INDEX "ix_favorites_idProperty" ON public.favorites USING btree ("idProperty");
CREATE INDEX "ix_favorites_idUser" ON public.favorites USING btree ("idUser");

-- Índices da tabela proposals
CREATE INDEX "ix_proposals_idProperty" ON public.proposals USING btree ("idProperty");
CREATE INDEX "ix_proposals_idUser" ON public.proposals USING btree ("idUser");
CREATE INDEX ix_proposals_status ON public.proposals USING btree (status);

-- Índices da tabela visits
CREATE INDEX "ix_visits_idProperty" ON public.visits USING btree ("idProperty");
CREATE INDEX "ix_visits_idUser" ON public.visits USING btree ("idUser");
CREATE INDEX "ix_visits_visitDate" ON public.visits USING btree ("visitDate");

-- ============================================
-- FIM DO DDL
-- ============================================