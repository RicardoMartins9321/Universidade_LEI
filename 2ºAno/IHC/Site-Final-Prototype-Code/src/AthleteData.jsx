const athleteData = [
    {
      name: "Carlos",
      gender: "Masculino",
      district: "Coimbra",
      birthDate: "10/08/1985",
      club: "Sport Lisboa e Benfica"
    },
    {
      name: "André",
      gender: "Masculino",
      district: "Algarve",
      birthDate: "25/04/1990",
      club: "Clube do Porto"
    },
    {
      name: "João Coelho",
      gender: "Masculino",
      district: "Aveiro",
      birthDate: "04/04/1999",
      club: "Sporting"
    },
    {
      name: "Carla",
      gender: "Femenino",
      district: "Aveiro",
      birthDate: "20/09/1988",
      club: "Vitória Sport Clube"
    },
    {
      name: "Otto",
      gender: "Masculino",
      district: "Porto",
      birthDate: "15/07/1992",
      club: "Boavista Clube"
    },
    {
      name: "Henrique",
      gender: "Masculino",
      district: "Lisboa",
      birthDate: "08/12/1997",
      club: "Sport Lisboa e Benfica"
    },
    {
      name: "Ana Costa",
      gender: "Femenino",
      district: "Setúbal",
      birthDate: "29/11/1986",
      club: "VTSC VITÓRIA S C"
    },
    {
      name: "Ricardo Santos",
      gender: "Masculino",
      district: "Viana do Castelo",
      birthDate: "12/05/1993",
      club: "CAM‐VC C A MAZAREFES"
    },
    {
      name: "Filipa Fernandes",
      gender: "Femenino",
      district: "Porto",
      birthDate: "05/04/1995",
      club: "CABB C A BAIXA BANHEIRA"
    },
    {
      name: "Hugo Oliveira",
      gender: "Masculino",
      district: "Faro",
      birthDate: "20/10/1984",
      club: "CFB C F OS BELENENSES"
    },
    {
      name: "Mariana Silva",
      gender: "Femenino",
      district: "Lisboa",
      birthDate: "17/08/1997",
      club: "SCP SPORTING C P"
    },
    {
      name: "José Santos",
      gender: "Masculino",
      district: "Lisboa",
      birthDate: "02/09/1983",
      club: "SCP SPORTING C P"
    },
    {
      name: "Ana Rita Pereira",
      gender: "Femenino",
      district: "Porto",
      birthDate: "14/03/1988",
      club: "SLB S L BENFICA"
    },
    {
      name: "Miguel Rodrigues",
      gender: "Masculino",
      district: "Braga",
      birthDate: "28/07/1996",
      club: "ACB‐L ATLÉTICO C BATALHA"
    },
    {
      name: "Carolina Fernandes",
      gender: "Femenino",
      district: "Aveiro",
      birthDate: "19/11/1982",
      club: "GAF G ATLETISMO FÁTIMA"
    },
    {
      name: "Tiago Costa",
      gender: "Masculino",
      district: "Faro",
      birthDate: "11/12/1994",
      club: "CFOD C F OLIVEIRA DOURO"
    },
    {
      name: "Sara Martins",
      gender: "Femenino",
      district: "Setúbal",
      birthDate: "09/08/1991",
      club: "SCB S CLUBE DE BRAGA"
    },
    {
      name: "André Moreira",
      gender: "Masculino",
      district: "Viseu",
      birthDate: "03/05/1997",
      club: "SVB SPORT VISEU BENFICA"
    },
    {
      name: "Beatriz Oliveira",
      gender: "Femenino",
      district: "Lisboa",
      birthDate: "18/02/1985",
      club: "SLB S L BENFICA"
    },
    {
      name: "Francisco Santos",
      gender: "Masculino",
      district: "Porto",
      birthDate: "27/11/1986",
      club: "CDS C DESP SANTO ANTÓNIO"
    },
    {
      name: "Margarida Sousa",
      gender: "Femenino",
      district: "Braga",
      birthDate: "05/10/1993",
      club: "CAMG C A MARINHA GRANDE"
    },
    {
      name: "Inês Oliveira",
      gender: "Femenino",
      district: "Porto",
      birthDate: "14/06/1996",
      club: "SCUT S C UNIÃO TORREENSE"
    },
    {
      name: "Ricardo Alves",
      gender: "Masculino",
      district: "Braga",
      birthDate: "23/09/1984",
      club: "ACB‐L ATLÉTICO C BATALHA"
    },
    {
      name: "Mariana Costa",
      gender: "Femenino",
      district: "Aveiro",
      birthDate: "02/03/1990",
      club: "GAF G ATLETISMO FÁTIMA"
    },
    {
      name: "Pedro Henriques",
      gender: "Masculino",
      district: "Coimbra",
      birthDate: "17/08/1982",
      club: "ACB‐L ATLÉTICO C BATALHA"
    },
    {
      name: "Ana Santos",
      gender: "Femenino",
      district: "Leiria",
      birthDate: "25/11/1983",
      club: "CIAIA C I A ILHA AZUL"
    },

    {
      name: "Miguel Oliveira",
      gender: "Masculino",
      district: "Braga",
      birthDate: "06/07/1996",
      club: "ACB‐L ATLÉTICO C BATALHA"
    },
    {
      name: "Carolina Moreira",
      gender: "Femenino",
      district: "Porto",
      birthDate: "12/10/1997",
      club: "SCB S CLUBE DE BRAGA"
    },
    {
      name: "Diogo Santos",
      gender: "Masculino",
      district: "Lisboa",
      birthDate: "18/11/1996",
      club: "SCP SPORTING C P"
    },
    {
      name: "Ana Catarina",
      gender: "Femenino",
      district: "Aveiro",
      birthDate: "25/08/1998",
      club: "GAF G ATLETISMO FÁTIMA"
    },
    {
      name: "Gonçalo Mendes",
      gender: "Masculino",
      district: "Porto",
      birthDate: "04/05/1999",
      club: "SLB S L BENFICA"
    },
    {
      name: "Mariana Costa",
      gender: "Femenino",
      district: "Lisboa",
      birthDate: "15/03/2001",
      club: "SLB S L BENFICA"
    },
    {
      name: "Rui Oliveira",
      gender: "Masculino",
      district: "Porto",
      birthDate: "27/07/2002",
      club: "SCB S CLUBE DE BRAGA"
    },
    {
      name: "Beatriz Santos",
      gender: "Femenino",
      district: "Aveiro",
      birthDate: "09/10/2000",
      club: "GAF G ATLETISMO FÁTIMA"
    },
    {
      name: "Daniel Pereira",
      gender: "Masculino",
      district: "Braga",
      birthDate: "04/05/2003",
      club: "ACB‐L ATLÉTICO C BATALHA"
    },
    {
      name: "Inês Moreira",
      gender: "Femenino",
      district: "Porto",
      birthDate: "21/11/2002",
      club: "SCP SPORTING C P"
    },
    {
      name: "Ana Carolina",
      gender: "Femenino",
      district: "Braga",
      birthDate: "08/09/2004",
      club: "ACB‐L ATLÉTICO C BATALHA"
    },
    {
      name: "Tiago Santos",
      gender: "Masculino",
      district: "Lisboa",
      birthDate: "14/12/2003",
      club: "SLB S L BENFICA"
    },
    {
      name: "Marta Oliveira",
      gender: "Femenino",
      district: "Porto",
      birthDate: "03/05/2005",
      club: "SCB S CLUBE DE BRAGA"
    },
    {
      name: "João Pedro",
      gender: "Masculino",
      district: "Aveiro",
      birthDate: "19/07/2002",
      club: "GAF G ATLETISMO FÁTIMA"
    },
    {
      name: "Sofia Mendes",
      gender: "Femenino",
      district: "Coimbra",
      birthDate: "26/10/2001",
      club: "SCP SPORTING C P"
    },
    {
      name: "Ana Oliveira",
      gender: "Femenino",
      district: "Setúbal",
      birthDate: "02/07/1997",
      club: "SCV SPORT C VALENCIANO"
    },
    {
      name: "Bruno Rodrigues",
      gender: "Masculino",
      district: "Viana do Castelo",
      birthDate: "15/09/2004",
      club: "CAMG C A MARINHA GRANDE"
    },
    {
      name: "Carolina Almeida",
      gender: "Femenino",
      district: "Bragança",
      birthDate: "27/11/2003",
      club: "CPTSC C P T SOBRAL CEIRA"
    },
    {
      name: "David Costa",
      gender: "Masculino",
      district: "Guarda",
      birthDate: "08/05/2002",
      club: "CDP CLUBE DESP DA PÓVOA"
    },
    {
      name: "Eduarda Santos",
      gender: "Femenino",
      district: "Castelo Branco",
      birthDate: "12/10/1995",
      club: "COP C ORIENTAL PECHÃO"
    },
    {
      name: "Fábio Mendes",
      gender: "Masculino",
      district: "Aveiro",
      birthDate: "23/08/1999",
      club: "SVB SPORT VISEU BENFICA"
    },
    {
      name: "Gabriela Fernandes",
      gender: "Femenino",
      district: "Porto",
      birthDate: "30/04/2001",
      club: "SCP SPORTING C P"
    },
    {
      name: "Hugo Alves",
      gender: "Masculino",
      district: "Braga",
      birthDate: "14/03/1998",
      club: "CABB C A BAIXA BANHEIRA"
    },
    {
      name: "Inês Pereira",
      gender: "Femenino",
      district: "Viseu",
      birthDate: "19/07/2000",
      club: "GAF G ATLETISMO FÁTIMA"
    },
    {
      name: "João Rodrigues",
      gender: "Masculino",
      district: "Coimbra",
      birthDate: "28/09/1996",
      club: "SLB S L BENFICA"
    },
    {
      name: "Lara Silva",
      gender: "Femenino",
      district: "Faro",
      birthDate: "10/12/1996",
      club: "CFB C F OS BELENENSES"
    },
    {
      name: "Manuel Sousa",
      gender: "Masculino",
      district: "Lisboa",
      birthDate: "05/07/1998",
      club: "SLB S L BENFICA"
    },
    {
      name: "Nádia Almeida",
      gender: "Femenino",
      district: "Bragança",
      birthDate: "22/03/1997",
      club: "CDS C DESP SANTO ANTÓNIO"
    },
    {
      name: "Orlando Santos",
      gender: "Masculino",
      district: "Leiria",
      birthDate: "18/09/2002",
      club: "GCA GINÁSIO C ALCOBAÇA"
    },
    {
      name: "Patrícia Martins",
      gender: "Femenino",
      district: "Portalegre",
      birthDate: "09/06/2003",
      club: "SLA NÚCLEO SCP ALMADA"
    },
    {
      name: "Quim Fernandes",
      gender: "Masculino",
      district: "Porto",
      birthDate: "14/04/1999",
      club: "CAM‐VC C A MAZAREFES"
    },
    {
      name: "Rita Pereira",
      gender: "Femenino",
      district: "Viseu",
      birthDate: "21/11/2001",
      club: "ACF AC FERNANDA RIBEIRO"
    },
    {
      name: "Sérgio Costa",
      gender: "Masculino",
      district: "Braga",
      birthDate: "26/08/2000",
      club: "ACB‐L ATLÉTICO C BATALHA"
    },
    {
      name: "Teresa Carvalho",
      gender: "Femenino",
      district: "Setúbal",
      birthDate: "03/05/1995",
      club: "SVB SPORT VISEU BENFICA"
    },
    {
      name: "Urbano Mendes",
      gender: "Masculino",
      district: "Faro",
      birthDate: "07/10/1997",
      club: "SCP SPORTING C P"
    },
    {
      name: "Vera Santos",
      gender: "Femenino",
      district: "Aveiro",
      birthDate: "12/08/1999",
      club: "GDE G DESP ESTREITO"
    },
    {
      name: "Xavier Silva",
      gender: "Masculino",
      district: "Porto",
      birthDate: "28/02/2004",
      club: "SCB S CLUBE DE BRAGA"
    },
    {
      name: "Yara Fernandes",
      gender: "Femenino",
      district: "Lisboa",
      birthDate: "15/11/1996",
      club: "SCP SPORTING C P"
    },
    {
      name: "Zé Maria",
      gender: "Masculino",
      district: "Bragança",
      birthDate: "10/10/1998",
      club: "ACB‐L ATLÉTICO C BATALHA"
    },
    {
      name: "Andreia Gonçalves",
      gender: "Femenino",
      district: "Braga",
      birthDate: "06/06/2002",
      club: "MAC MAIA A C"
    },
    {
      name: "Bruno Fernandes",
      gender: "Masculino",
      district: "Lisboa",
      birthDate: "23/03/2003",
      club: "SCP SPORTING C P"
    },
    {
      name: "Carla Costa",
      gender: "Femenino",
      district: "Viana do Castelo",
      birthDate: "17/09/1995",
      club: "CPTSC C P T SOBRAL CEIRA"
    },
    {
      name: "David Silva",
      gender: "Masculino",
      district: "Porto",
      birthDate: "02/04/1997",
      club: "SCP SPORTING C P"
    },
    {
      name: "Eduarda Fernandes",
      gender: "Femenino",
      district: "Faro",
      birthDate: "30/07/2000",
      club: "SCB S CLUBE DE BRAGA"
    },
    {
      name: "Fernando Oliveira",
      gender: "Masculino",
      district: "Setúbal",
      birthDate: "21/12/1999",
      club: "SCP SPORTING C P"
    },
    {
      name: "Gabriela Almeida",
      gender: "Femenino",
      district: "Lisboa",
      birthDate: "14/01/2001",
      club: "SLB S L BENFICA"
    },
    {
      name: "Hugo Costa",
      gender: "Masculino",
      district: "Porto",
      birthDate: "03/09/1998",
      club: "ACM‐A A CRISTÂ MOCIDADE"
    },
    {
      name: "Inês Fernandes",
      gender: "Femenino",
      district: "Aveiro",
      birthDate: "29/05/1997",
      club: "CAM‐VC C A MAZAREFES"
    },
    {
      name: "João Oliveira",
      gender: "Masculino",
      district: "Braga",
      birthDate: "05/03/2002",
      club: "ACF AC FERNANDA RIBEIRO"
    },
    {
      name: "Katia Silva",
      gender: "Femenino",
      district: "Viseu",
      birthDate: "18/10/1996",
      club: "CPTSC C P T SOBRAL CEIRA"
    },
    {
      name: "Leandro Gonçalves",
      gender: "Masculino",
      district: "Porto",
      birthDate: "24/07/2001",
      club: "SCP SPORTING C P"
    },
    {
      name: "Mariana Santos",
      gender: "Femenino",
      district: "Lisboa",
      birthDate: "08/04/2000",
      club: "SCP SPORTING C P"
    },
    {
      name: "Nuno Alves",
      gender: "Masculino",
      district: "Bragança",
      birthDate: "11/11/1995",
      club: "ACB‐L ATLÉTICO C BATALHA"
    },
    {
      name: "Olga Pereira",
      gender: "Femenino",
      district: "Setúbal",
      birthDate: "26/06/2003",
      club: "SCV SPORT C VALENCIANO"
    },
    {
      name: "Pedro Oliveira",
      gender: "Masculino",
      district: "Porto",
      birthDate: "19/05/2000",
      club: "SLB S L BENFICA"
    }
  ];

export default athleteData;