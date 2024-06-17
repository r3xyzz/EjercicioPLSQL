--3_2_2

CREATE OR REPLACE FUNCTION obtener_nombre_administrador (p_id_edif NUMBER) RETURN VARCHAR2 IS
    v_nombre_completo VARCHAR2(100);
BEGIN
    SELECT a.pnombre_adm || ' ' || a.appaterno_adm
    INTO v_nombre_completo
    FROM ADMINISTRADOR a
    JOIN EDIFICIO e ON a.numrun_adm = e.numrun_adm
    WHERE e.id_edif = p_id_edif;

    RETURN v_nombre_completo;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END obtener_nombre_administrador;

--------------------------------------------------------

CREATE OR REPLACE FUNCTION obtener_nombre_responsable (p_id_edif NUMBER, p_nro_depto NUMBER) RETURN VARCHAR2 IS
    v_nombre_completo VARCHAR2(100);
BEGIN
    SELECT pnombre_rpgc || ' ' || appaterno_rpgc
    INTO v_nombre_completo
    FROM RESPONSABLE_PAGO_GASTO_COMUN
    WHERE numrun_rpgc IN (SELECT numrun_rpgc FROM DEPARTAMENTO WHERE id_edif = p_id_edif AND nro_depto = p_nro_depto);

    RETURN v_nombre_completo;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END obtener_nombre_responsable;

------------------------------------------------------------

CREATE OR REPLACE FUNCTION obtener_nombre_edificio (p_id_edif NUMBER) RETURN VARCHAR2 IS
    v_nombre_edificio VARCHAR2(100);
BEGIN
    SELECT nombre_edif
    INTO v_nombre_edificio
    FROM EDIFICIO
    WHERE id_edif = p_id_edif;

    RETURN v_nombre_edificio;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END obtener_nombre_edificio;

==================================================================


