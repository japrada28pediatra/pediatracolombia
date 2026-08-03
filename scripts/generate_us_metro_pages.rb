require 'cgi'
require 'json'
require 'uri'

BASE_URL = 'https://pediatracolombia.com'
PHONE = '573187022574'
UPDATED_ISO = '2026-08-03'
UPDATED_HUMAN = '3 de agosto de 2026'

METROS = [
  {
    slug: 'pediatra-colombiana-online-en-los-angeles.html',
    city: 'Los Ángeles',
    short: 'Los Ángeles',
    region: 'California',
    metro: 'Los Ángeles–Long Beach–Anaheim',
    population: '5,9 millones',
    areas: 'Los Ángeles, Long Beach, Anaheim, el Valle de San Fernando y otras comunidades del sur de California',
    title: 'Pediatra colombiana online en Los Ángeles | En español',
    description: 'Orientación con pediatra colombiana online para familias latinas en Los Ángeles. Consulta en español sobre lactancia, sueño, alimentación y desarrollo.',
    lead: 'Un espacio en español para ordenar dudas sobre la salud y el desarrollo de tu hijo, comprender mejor indicaciones recibidas en California y preparar los siguientes pasos con su equipo pediátrico local.',
    context_title: 'Acompañamiento pediátrico en español para el ritmo de Los Ángeles',
    context: [
      'En un área metropolitana extensa, coordinar trabajo, escuela, tráfico y citas médicas puede dejar preguntas importantes para después. La orientación virtual permite reservar un momento desde casa para revisar antecedentes, registros y dudas con calma.',
      'También puede ser útil cuando la familia entiende el inglés cotidiano, pero prefiere hablar de lactancia, crecimiento, sueño o desarrollo en español. La consulta ayuda a organizar la información; los exámenes físicos, vacunas, fórmulas válidas en Estados Unidos y urgencias continúan con profesionales autorizados en California.'
    ],
    local_cards: [
      ['Documentos en dos idiomas', 'Puedes compartir reportes, resultados o instrucciones en inglés y conversar en español sobre qué significan y qué preguntas llevar a la próxima cita local.'],
      ['Una metrópoli extensa', 'La atención está pensada para familias de Los Ángeles, Long Beach, Anaheim y comunidades cercanas que buscan una conversación pediátrica sin desplazarse.'],
      ['Agenda según tu hora local', 'El horario se confirma usando la hora de Los Ángeles para evitar confusiones por cambios estacionales entre California y Colombia.']
    ],
    faq: [
      ['¿La orientación está disponible para familias de todo el condado de Los Ángeles?', 'Sí. Al ser virtual, pueden solicitar orientación familias de Los Ángeles, Long Beach, el Valle de San Fernando y otras comunidades del área metropolitana. Siempre se confirma la ubicación del niño antes de comenzar.'],
      ['¿Puedo revisar en español un informe pediátrico escrito en inglés?', 'Sí. Puedes enviar el informe antes de la sesión para conversar en español sobre sus términos, organizar dudas y preparar preguntas. La interpretación definitiva y las decisiones clínicas corresponden al equipo que evaluó al niño en California.'],
      ['¿Sirve si quiero una segunda mirada sobre alimentación o crecimiento?', 'Puede servir para revisar la historia, mediciones previas, hábitos y recomendaciones recibidas. Si hace falta explorar al niño, repetir medidas o pedir pruebas, se recomendará una valoración local.'],
      ['¿La consulta reemplaza al pediatra de mi hijo en Los Ángeles?', 'No. Es un acompañamiento complementario en español y no reemplaza el hogar médico local, los controles de rutina, la vacunación ni la atención presencial.'],
      ['¿Qué debo preparar para hablar sobre lactancia o un recién nacido?', 'Ten disponibles edad gestacional, peso al nacer, pesos recientes, frecuencia de tomas, pañales, medicamentos y las preguntas que más te preocupan. En bebés pequeños puede ser especialmente importante coordinar seguimiento presencial.'],
      ['¿La doctora puede enviar una receta válida en California?', 'La página no promete recetas, órdenes ni certificados válidos en Estados Unidos. Esos documentos dependen de las licencias y normas del lugar donde está el paciente y deben gestionarse con un profesional autorizado localmente.'],
      ['¿Cómo se coordina la diferencia horaria entre Colombia y California?', 'Al agendar se confirma la hora exacta de Los Ángeles. La diferencia con Colombia puede cambiar durante el año, por lo que el mensaje de confirmación usa la zona horaria local.'],
      ['¿Cuándo no debo esperar una orientación online?', 'Si hay dificultad para respirar, convulsiones, coloración azulada, pérdida de conciencia, deshidratación importante o deterioro rápido, llama al 911 o acude a emergencias en Los Ángeles.']
    ]
  },
  {
    slug: 'pediatra-colombiana-online-en-new-york.html',
    city: 'Nueva York',
    short: 'Nueva York',
    region: 'Nueva York',
    metro: 'Nueva York–Newark–Jersey City',
    population: '5,1 millones',
    areas: 'los cinco boroughs, Long Island, Westchester y comunidades cercanas del área triestatal',
    title: 'Pediatra colombiana online en Nueva York | En español',
    description: 'Pediatra colombiana online para familias en Nueva York. Orientación pediátrica en español, segunda opinión y acompañamiento para padres latinos.',
    lead: 'Orientación pediátrica en español para familias de Nueva York que quieren entender mejor la historia de su hijo, preparar preguntas y complementar la atención que reciben en su red local.',
    context_title: 'Claridad pediátrica para familias latinas del área de Nueva York',
    context: [
      'Entre pediatra primario, urgent care, especialistas, escuela y seguros, una familia puede recibir mucha información en poco tiempo. La sesión online ofrece un espacio para reconstruir la línea de tiempo, revisar documentos y decidir cuáles dudas deben resolverse con el equipo local.',
      'La atención se adapta a familias de los cinco boroughs y del área metropolitana, pero no se presenta como un consultorio en Nueva York. Es orientación profesional desde Colombia y no sustituye una evaluación presencial ni autoriza prescripciones en Estados Unidos.'
    ],
    local_cards: [
      ['Historia clínica organizada', 'Reúne notas del pediatra, resultados, lista de medicamentos y mensajes del portal para convertir información dispersa en preguntas concretas.'],
      ['Familias del área triestatal', 'La sesión puede coordinarse desde Brooklyn, Queens, Bronx, Manhattan, Staten Island, Long Island o comunidades cercanas.'],
      ['Citas en hora de Nueva York', 'La confirmación utiliza Eastern Time y tiene en cuenta los cambios de horario estacional frente a Colombia.']
    ],
    faq: [
      ['¿Atienden virtualmente a familias de Brooklyn, Queens o el Bronx?', 'Sí. La orientación puede solicitarse desde cualquiera de los cinco boroughs y desde otras zonas del área metropolitana. Antes de la sesión se confirma dónde se encuentra el niño.'],
      ['¿Puedo pedir ayuda para ordenar varias opiniones de especialistas?', 'Sí. Puedes compartir resúmenes, resultados y recomendaciones para construir una cronología y preparar preguntas. La sesión no sustituye la coordinación clínica entre los especialistas autorizados en Nueva York.'],
      ['¿La consulta sirve para hablar de sueño, conducta o alimentación?', 'Sí, cuando el objetivo es revisar hábitos, antecedentes y señales de alarma. Algunos problemas requieren examen físico, evaluación del desarrollo o apoyo interdisciplinario local.'],
      ['¿Es una consulta médica local de Nueva York?', 'No. Es orientación pediátrica online en español brindada desde Colombia. No equivale a tener un pediatra licenciado en Nueva York ni reemplaza el seguimiento presencial.'],
      ['¿Qué documentos del portal del hospital puedo enviar?', 'Puedes compartir notas de alta, resultados, curvas de crecimiento, lista de medicamentos o instrucciones que quieras comprender mejor, protegiendo siempre la información que no sea necesaria para la consulta.'],
      ['¿Se pueden emitir formularios para escuela o daycare?', 'No se promete completar formularios, certificados, órdenes o recetas válidas en Estados Unidos. Normalmente esos documentos deben ser emitidos por el pediatra local que conoce y examina al niño.'],
      ['¿Cómo sé la hora de la cita si cambia el horario de verano?', 'La confirmación se envía en la hora local de Nueva York. Así se evita calcular manualmente la diferencia con Colombia, que varía en algunos meses.'],
      ['¿Qué hago ante una emergencia pediátrica en Nueva York?', 'Llama al 911 o acude al servicio de emergencias más cercano si hay dificultad respiratoria, convulsiones, pérdida de conciencia, lesión grave, coloración azulada o empeoramiento rápido.']
    ]
  },
  {
    slug: 'pediatra-colombiana-online-en-miami.html',
    city: 'Miami',
    short: 'Miami',
    region: 'Florida',
    metro: 'Miami–Fort Lauderdale–West Palm Beach',
    population: '2,8 millones',
    areas: 'Miami-Dade, Fort Lauderdale, Broward, Palm Beach y comunidades cercanas del sur de Florida',
    title: 'Pediatra colombiana online en Miami | Consulta en español',
    description: 'Orientación pediátrica online en español para familias de Miami. Pediatra colombiana para dudas de bebés, lactancia, sueño, alimentación y desarrollo.',
    lead: 'Una conversación pediátrica cercana y completamente en español para familias del sur de Florida que quieren revisar dudas, preparar un control o comprender mejor indicaciones locales.',
    context_title: 'Una orientación culturalmente cercana para familias de Miami',
    context: [
      'Aunque el español está muy presente en Miami, no siempre es sencillo encontrar tiempo suficiente para explicar con detalle las rutinas, preocupaciones y expectativas de cada familia. La sesión virtual se centra en escuchar, ordenar prioridades y dejar claros los próximos pasos.',
      'El acompañamiento puede aportar contexto latino y colombiano sin competir con el pediatra local. Las vacunas, el examen físico, la atención urgente y cualquier documento válido en Florida deben resolverse dentro del sistema de salud de Estados Unidos.'
    ],
    local_cards: [
      ['Español con contexto colombiano', 'Puedes hablar con naturalidad sobre prácticas familiares, alimentos, remedios o términos usados en Colombia y contrastarlos con recomendaciones seguras.'],
      ['Cobertura del sur de Florida', 'La orientación se coordina con familias de Miami-Dade, Broward, Fort Lauderdale, Palm Beach y zonas cercanas.'],
      ['Seguimiento bien preparado', 'La sesión ayuda a llevar un resumen claro al pediatra local y a identificar qué datos conviene registrar antes del siguiente control.']
    ],
    faq: [
      ['¿La consulta es solo para familias colombianas que viven en Miami?', 'No. Está abierta a familias latinas e hispanohablantes del sur de Florida que valoran una orientación pediátrica en español, independientemente de su nacionalidad.'],
      ['¿Puedo consultar por diferencias entre recomendaciones de Colombia y Estados Unidos?', 'Sí. Se pueden revisar prácticas de alimentación, sueño, lactancia o cuidado cotidiano y explicar por qué algunas recomendaciones cambian según guías, edad y contexto.'],
      ['¿Sirve para preparar la primera cita de un recién nacido en Miami?', 'Puede ayudarte a organizar antecedentes del embarazo y parto, alimentación, pañales, pesos y preguntas. El recién nacido también necesita seguimiento presencial oportuno con un profesional local.'],
      ['¿La Dra. Jazmín atiende presencialmente en Miami?', 'No. La atención para familias en Miami es online desde Colombia. La consulta presencial y domiciliaria de la doctora se ofrece únicamente en Bogotá.'],
      ['¿Puedo enviar fotos o videos antes de la orientación?', 'Solo cuando sean pertinentes y mediante el canal acordado. Una imagen no reemplaza el examen físico; si el hallazgo requiere palpación, auscultación o pruebas, se indicará atención local.'],
      ['¿Se pueden formular medicamentos para recoger en una farmacia de Florida?', 'No se promete prescripción válida en Florida. Las recetas, órdenes y certificados dependen de la normativa y de la licencia profesional en el lugar donde está el paciente.'],
      ['¿La hora de Miami suele coincidir con Colombia?', 'No siempre. Durante parte del año puede existir diferencia horaria. La cita se confirma expresamente en la hora local de Miami.'],
      ['¿Cuándo debo usar emergencias y no WhatsApp?', 'Ante dificultad respiratoria, convulsiones, pérdida de conciencia, coloración azulada, lesión grave o deterioro rápido, llama al 911 o busca atención de emergencia en Florida.']
    ]
  },
  {
    slug: 'pediatra-colombiana-online-en-houston.html',
    city: 'Houston',
    short: 'Houston',
    region: 'Texas',
    metro: 'Houston–The Woodlands–Sugar Land',
    population: '2,8 millones',
    areas: 'Houston, Katy, Sugar Land, The Woodlands, Pasadena y otras comunidades del sureste de Texas',
    title: 'Pediatra colombiana online en Houston | En español',
    description: 'Pediatra colombiana online para familias latinas en Houston. Orientación en español sobre recién nacidos, lactancia, sueño, alimentación y desarrollo.',
    lead: 'Acompañamiento pediátrico en español para organizar dudas y antecedentes antes o después de una cita local en Houston, con límites claros entre orientación virtual y atención médica en Texas.',
    context_title: 'Apoyo en español para familias del gran Houston',
    context: [
      'El área de Houston reúne familias que viven a distancias considerables de hospitales y consultorios. Una sesión online puede facilitar la revisión de dudas no urgentes, especialmente cuando el objetivo es prepararse para una cita o comprender recomendaciones ya recibidas.',
      'La conversación no reemplaza la evaluación del pediatra local. En Texas, el examen físico, las vacunas, las pruebas, las recetas y la atención de síntomas agudos deben coordinarse con profesionales autorizados donde se encuentra el niño.'
    ],
    local_cards: [
      ['Preparación antes del control', 'Llega con una lista priorizada de preguntas, curvas de crecimiento, vacunas, medicamentos y notas de síntomas para aprovechar mejor la sesión.'],
      ['Gran Houston sin desplazamientos', 'Familias de Houston, Katy, Sugar Land, The Woodlands y Pasadena pueden conectarse desde casa para una orientación no urgente.'],
      ['Plan de señales y próximos pasos', 'Al terminar, sabrás qué observar, qué información registrar y qué asuntos debes llevar al pediatra o servicio local.']
    ],
    faq: [
      ['¿Puedo solicitar orientación si vivo en Katy, Sugar Land o The Woodlands?', 'Sí. La modalidad virtual permite acompañar a familias de distintas comunidades del área metropolitana de Houston, siempre confirmando la ubicación del niño antes de la sesión.'],
      ['¿La consulta puede ayudarme a preparar una visita con un especialista?', 'Sí. Se pueden ordenar antecedentes, síntomas, estudios previos y preguntas para que la visita local sea más productiva. No reemplaza la evaluación ni la coordinación del especialista en Texas.'],
      ['¿Qué temas no urgentes suelen revisarse online?', 'Rutinas de sueño, lactancia, alimentación complementaria, crecimiento con datos disponibles, desarrollo y dudas de crianza son temas frecuentes. Cada caso se filtra para saber si necesita examen presencial.'],
      ['¿La doctora tiene consultorio en Houston?', 'No. La orientación para Houston se brinda online desde Colombia. La página no representa una sede, clínica ni práctica médica establecida en Texas.'],
      ['¿Qué pasa si durante la conversación parece necesario examinar al niño?', 'Se explicará por qué hace falta una valoración presencial y con qué prioridad buscarla. La sesión virtual no debe retrasar urgent care, emergencias o una cita local.'],
      ['¿Puedo obtener una orden de laboratorio o receta para Texas?', 'No se garantiza ningún documento clínico válido en Texas. Las órdenes, recetas y certificados deben cumplir las reglas del estado y normalmente requieren un profesional autorizado localmente.'],
      ['¿La cita se confirma en Central Time?', 'Sí. El mensaje de agenda especifica la hora local de Houston para contemplar los cambios estacionales respecto de Colombia.'],
      ['¿Cuándo debo llamar al 911 en Houston?', 'Llama al 911 ante dificultad respiratoria intensa, convulsiones, pérdida de conciencia, coloración azulada, lesión grave o deterioro rápido. No esperes respuesta por WhatsApp.']
    ]
  },
  {
    slug: 'pediatra-colombiana-online-en-riverside.html',
    city: 'Riverside',
    short: 'Riverside',
    region: 'California',
    metro: 'Riverside–San Bernardino–Ontario',
    population: '2,5 millones',
    areas: 'Riverside, San Bernardino, Ontario, Moreno Valley, Corona y otras comunidades del Inland Empire',
    title: 'Pediatra colombiana online en Riverside | En español',
    description: 'Orientación con pediatra colombiana online para familias latinas de Riverside y el Inland Empire. Atención en español para dudas pediátricas no urgentes.',
    lead: 'Orientación pediátrica en español para familias de Riverside y el Inland Empire que buscan revisar dudas no urgentes sin sumar otro desplazamiento por una región extensa.',
    context_title: 'Orientación pediátrica para familias latinas del Inland Empire',
    context: [
      'En Riverside y San Bernardino, las distancias entre vivienda, escuela, trabajo y centros médicos pueden complicar la organización familiar. Una sesión online permite revisar registros y preguntas desde casa cuando el motivo es apropiado para orientación virtual.',
      'La consulta ayuda a preparar decisiones y conversaciones con el equipo local, pero no sustituye el examen físico. Las vacunas, pruebas, prescripciones y urgencias deben atenderse con profesionales autorizados en California.'
    ],
    local_cards: [
      ['Menos barreras de distancia', 'La modalidad online evita un trayecto adicional para conversar sobre dudas de rutina que no necesitan exploración física inmediata.'],
      ['Inland Empire en español', 'Pueden solicitar orientación familias de Riverside, San Bernardino, Ontario, Moreno Valley, Corona y comunidades vecinas.'],
      ['Información lista para compartir', 'Recibe una estructura clara de antecedentes y preguntas para continuar el cuidado con el pediatra o especialista local.']
    ],
    faq: [
      ['¿La orientación cubre Riverside y San Bernardino?', 'Sí. Está pensada para familias de toda el área Riverside–San Bernardino–Ontario y otras comunidades del Inland Empire, siempre en modalidad virtual.'],
      ['¿Puede ser útil si tengo que viajar lejos para ver al especialista?', 'Puede ayudarte a preparar la visita, ordenar estudios y priorizar preguntas. No reemplaza la cita con el especialista ni permite decidir a distancia si un examen presencial puede omitirse.'],
      ['¿Puedo consultar sobre selectividad alimentaria o sueño?', 'Sí. Se puede revisar la historia, rutinas y señales relevantes. Cuando hay pérdida de peso, dificultad para tragar, pausas respiratorias u otras alertas, se recomienda evaluación local.'],
      ['¿Existe atención presencial de la doctora en Riverside?', 'No. La Dra. Jazmín ofrece orientación online desde Colombia para familias del Inland Empire; no cuenta con consultorio en California.'],
      ['¿Qué mediciones conviene tener disponibles?', 'Peso, talla, perímetro cefálico en bebés, fechas de medición y curvas del pediatra local pueden aportar contexto. Las medidas caseras se interpretan con cautela.'],
      ['¿La sesión permite obtener certificados o recetas de California?', 'No se promete emitir documentos válidos en California. Deben gestionarse con un profesional autorizado que pueda cumplir los requisitos del estado y examinar al niño cuando corresponda.'],
      ['¿Cómo se agenda según la hora de Riverside?', 'La confirmación indica la hora de California. Esto evita errores porque la diferencia con Colombia cambia durante el horario de verano.'],
      ['¿Qué signos necesitan emergencias en el Inland Empire?', 'Dificultad respiratoria, convulsiones, pérdida de conciencia, coloración azulada, deshidratación importante o lesión grave requieren llamar al 911 o acudir a emergencias.']
    ]
  },
  {
    slug: 'pediatra-colombiana-online-en-dallas.html',
    city: 'Dallas–Fort Worth',
    short: 'Dallas–Fort Worth',
    region: 'Texas',
    metro: 'Dallas–Fort Worth–Arlington',
    population: '2,3 millones',
    areas: 'Dallas, Fort Worth, Arlington, Plano, Irving, Frisco y otras comunidades del norte de Texas',
    title: 'Pediatra colombiana online en Dallas–Fort Worth | Español',
    description: 'Pediatra colombiana online para familias latinas de Dallas–Fort Worth. Orientación en español sobre bebés, lactancia, sueño, alimentación y desarrollo.',
    lead: 'Una sesión pediátrica en español para familias de Dallas–Fort Worth que necesitan organizar preguntas, revisar antecedentes y complementar el seguimiento de su hijo en el norte de Texas.',
    context_title: 'Un punto de apoyo pediátrico en español para DFW',
    context: [
      'Dallas–Fort Worth funciona como una red de ciudades y suburbios donde el pediatra, la escuela y los especialistas pueden estar en lugares distintos. La orientación virtual facilita reunir la información antes de decidir el siguiente paso local.',
      'El servicio es complementario y se brinda desde Colombia. No equivale a atención médica establecida en Texas y no sustituye controles presenciales, urgent care, emergencias, vacunación ni documentos emitidos por profesionales autorizados en el estado.'
    ],
    local_cards: [
      ['Una sesión para todo DFW', 'Familias de Dallas, Fort Worth, Arlington, Plano, Irving o Frisco pueden conectarse sin importar en qué parte del metroplex vivan.'],
      ['Preguntas con prioridad', 'Separa lo que puede esperar, lo que merece una cita programada y lo que necesita valoración local más rápida.'],
      ['Continuidad entre servicios', 'Organiza la información recibida en consultorios, hospitales, escuela o terapias para conversar con mayor claridad con cada profesional.']
    ],
    faq: [
      ['¿Atienden familias tanto de Dallas como de Fort Worth?', 'Sí. La orientación es virtual para familias de todo el metroplex, incluyendo Arlington, Plano, Irving, Frisco y otras comunidades del norte de Texas.'],
      ['¿Puedo revisar dudas antes de un well-child visit?', 'Sí. Puedes preparar preguntas sobre crecimiento, vacunas, sueño, alimentación o desarrollo para aprovechar mejor el control presencial con el pediatra local.'],
      ['¿La sesión sirve para entender una remisión a terapia o especialista?', 'Puede ayudar a comprender el motivo general de la remisión y organizar antecedentes. La indicación definitiva y el plan corresponden al profesional que evaluó al niño en Texas.'],
      ['¿La doctora está licenciada y ubicada en Dallas–Fort Worth?', 'La página ofrece orientación desde Colombia y no afirma que exista una práctica o licencia local en Texas. Por eso se mantienen límites claros con la atención médica estadounidense.'],
      ['¿Debo conectar al niño durante toda la videollamada?', 'Depende del motivo y de la edad. Un adulto responsable debe estar disponible, y puede pedirse observar al niño brevemente; esto nunca equivale a un examen físico completo.'],
      ['¿Puedo recibir una receta para usar en Dallas o Fort Worth?', 'No se promete prescripción, orden o certificado válido en Texas. Esos documentos deben cumplir la normativa local y suelen requerir un profesional autorizado en el estado.'],
      ['¿La agenda usa la hora de Dallas?', 'Sí. La confirmación se envía en Central Time y contempla que la diferencia con Colombia puede variar durante el año.'],
      ['¿Qué hago si mi hijo empeora mientras espero la cita?', 'No esperes la sesión ni una respuesta por WhatsApp. Ante dificultad respiratoria, convulsiones, pérdida de conciencia, coloración azulada o lesión grave, llama al 911.']
    ]
  },
  {
    slug: 'pediatra-colombiana-online-en-chicago.html',
    city: 'Chicago',
    short: 'Chicago',
    region: 'Illinois',
    metro: 'Chicago–Naperville–Elgin',
    population: '2,2 millones',
    areas: 'Chicago, Cicero, Aurora, Naperville, Elgin y comunidades cercanas de Illinois',
    title: 'Pediatra colombiana online en Chicago | En español',
    description: 'Orientación pediátrica online en español para familias latinas de Chicago. Pediatra colombiana para lactancia, sueño, alimentación y desarrollo infantil.',
    lead: 'Acompañamiento pediátrico en español para familias del área de Chicago que desean revisar información, preparar un control o conversar con calma sobre el desarrollo y las rutinas de sus hijos.',
    context_title: 'Orientación en español para familias del área de Chicago',
    context: [
      'Los cambios de clima, escuela, guardería y rutinas familiares pueden generar muchas preguntas, pero la orientación evita convertir variaciones normales en diagnósticos a distancia. La sesión se apoya en la historia y ayuda a reconocer cuándo consultar localmente.',
      'La atención online desde Colombia complementa el hogar médico del niño. Un profesional en Illinois debe encargarse del examen físico, las vacunas, los síntomas agudos, las recetas y cualquier seguimiento que dependa de la presencia del paciente.'
    ],
    local_cards: [
      ['Rutinas y contexto familiar', 'Revisa sueño, alimentación, escuela y cambios cotidianos sin perder de vista la edad, el desarrollo y los antecedentes del niño.'],
      ['Chicago y sus suburbios', 'La modalidad está disponible para familias de Chicago, Cicero, Aurora, Naperville, Elgin y otras comunidades del área metropolitana.'],
      ['Puente con la atención local', 'Convierte la sesión en una lista práctica de observaciones y preguntas para el pediatra, urgent care o especialista cuando sea necesario.']
    ],
    faq: [
      ['¿La orientación está disponible en los suburbios de Chicago?', 'Sí. Familias de Aurora, Naperville, Elgin, Cicero y otras comunidades pueden conectarse en español, igual que quienes viven dentro de Chicago.'],
      ['¿Puedo consultar por cambios de sueño o apetito durante el invierno?', 'Sí, para revisar rutinas, contexto y señales de alarma. No se atribuyen síntomas al clima sin evaluación; si hay decaimiento, pérdida de peso u otros signos, se recomienda consulta local.'],
      ['¿Sirve para preparar preguntas sobre desarrollo o escuela?', 'Sí. Puedes organizar observaciones sobre lenguaje, conducta, aprendizaje y relaciones. La evaluación formal puede requerir al pediatra, la escuela o especialistas autorizados en Illinois.'],
      ['¿La Dra. Jazmín ofrece consultas presenciales en Illinois?', 'No. Para Chicago la modalidad es exclusivamente online desde Colombia. La atención presencial de la doctora se limita a Bogotá.'],
      ['¿Qué información ayuda si mi hijo ha visitado urgent care?', 'Ten disponibles el resumen de alta, diagnóstico informado, medicamentos, resultados y evolución desde la visita. Si el niño empeora, debe regresar a atención local sin esperar la orientación.'],
      ['¿La consulta produce recetas o notas para la escuela en Chicago?', 'No se prometen recetas, excusas, formularios ni órdenes válidas en Illinois. Esos documentos corresponden al profesional local que cumple los requisitos aplicables.'],
      ['¿La cita se agenda en Central Time?', 'Sí. La hora se confirma según Chicago y se ajusta a los cambios estacionales para que no tengas que calcular la diferencia con Colombia.'],
      ['¿Qué síntomas requieren llamar al 911?', 'Dificultad respiratoria grave, convulsiones, pérdida de conciencia, coloración azulada, lesión importante o deterioro rápido requieren emergencias locales inmediatas.']
    ]
  },
  {
    slug: 'pediatra-colombiana-online-en-phoenix.html',
    city: 'Phoenix',
    short: 'Phoenix',
    region: 'Arizona',
    metro: 'Phoenix–Mesa–Chandler',
    population: '1,6 millones',
    areas: 'Phoenix, Mesa, Chandler, Glendale, Scottsdale, Tempe y otras comunidades del Valle del Sol',
    title: 'Pediatra colombiana online en Phoenix | Consulta en español',
    description: 'Pediatra colombiana online para familias latinas de Phoenix, Mesa y Chandler. Orientación en español sobre bebés, lactancia, sueño y desarrollo.',
    lead: 'Orientación pediátrica en español para familias del Valle del Sol que quieren revisar dudas no urgentes y preparar decisiones informadas junto con su pediatra local.',
    context_title: 'Acompañamiento pediátrico para familias latinas del Valle del Sol',
    context: [
      'En Phoenix, las altas temperaturas y las grandes distancias pueden modificar rutinas, pero cualquier preocupación por hidratación o enfermedad debe evaluarse según la edad y los síntomas, no solo por el clima. La sesión ayuda a ordenar el contexto sin diagnosticar a distancia.',
      'La orientación se brinda desde Colombia y complementa la atención en Arizona. Si el niño necesita exploración, pruebas, vacunación, medicamentos o atención urgente, la familia debe acudir a un profesional autorizado localmente.'
    ],
    local_cards: [
      ['Contexto cotidiano bien descrito', 'Registra horarios, líquidos, pañales, alimentación, sueño y actividad cuando esos datos sean relevantes para la preocupación familiar.'],
      ['Todo el Valle del Sol', 'Familias de Phoenix, Mesa, Chandler, Glendale, Scottsdale o Tempe pueden solicitar una sesión virtual en español.'],
      ['Hora de Arizona confirmada', 'La agenda especifica la hora local porque Arizona maneja el horario estacional de forma distinta a muchos otros estados.']
    ],
    faq: [
      ['¿Puedo agendar desde Mesa, Chandler o Glendale?', 'Sí. La orientación cubre virtualmente el área Phoenix–Mesa–Chandler y otras comunidades del Valle del Sol. La ubicación exacta se confirma antes de comenzar.'],
      ['¿Puedo consultar por hidratación durante días de mucho calor?', 'Se pueden revisar hábitos y señales generales, pero un bebé o niño con decaimiento, pocos pañales, vómitos persistentes o signos de deshidratación necesita valoración local oportuna.'],
      ['¿La consulta ayuda con sueño y cambios de rutina?', 'Sí. Se revisan horarios, siestas, ambiente, pantallas, alimentación y salud. Ronquidos, pausas respiratorias o somnolencia marcada requieren evaluación presencial.'],
      ['¿La doctora atiende en un consultorio de Phoenix?', 'No. La atención para Arizona es orientación online desde Colombia y no representa una clínica o práctica médica local.'],
      ['¿Qué debo tener listo para una consulta sobre crecimiento?', 'Fechas y valores de peso, talla y perímetro cefálico, curvas del pediatra, antecedentes de nacimiento y una descripción de la alimentación aportan contexto.'],
      ['¿Puedo pedir una receta válida en Arizona?', 'No se promete emitir recetas, órdenes o certificados válidos en Arizona. Estos requieren cumplir la normativa local y, cuando corresponde, una evaluación presencial.'],
      ['¿Por qué es importante confirmar la zona horaria de Phoenix?', 'Arizona no sigue los mismos cambios estacionales que la mayoría de Estados Unidos. Por eso la confirmación incluye la hora exacta de Phoenix y no solo una diferencia calculada con Colombia.'],
      ['¿Cuándo debo buscar emergencias inmediatamente?', 'Llama al 911 ante dificultad respiratoria, convulsiones, pérdida de conciencia, coloración azulada, deshidratación grave, lesión importante o deterioro rápido.']
    ]
  },
  {
    slug: 'pediatra-colombiana-online-en-san-antonio.html',
    city: 'San Antonio',
    short: 'San Antonio',
    region: 'Texas',
    metro: 'San Antonio–New Braunfels',
    population: '1,4 millones',
    areas: 'San Antonio, New Braunfels, Schertz, Cibolo y comunidades cercanas del centro-sur de Texas',
    title: 'Pediatra colombiana online en San Antonio | Español',
    description: 'Orientación con pediatra colombiana online para familias latinas en San Antonio. Consulta en español sobre lactancia, alimentación, sueño y desarrollo.',
    lead: 'Una conversación pediátrica clara en español para familias de San Antonio y New Braunfels que desean preparar un control, ordenar antecedentes o revisar dudas de crianza.',
    context_title: 'Orientación pediátrica cercana para el área de San Antonio',
    context: [
      'Vivir en una ciudad bilingüe no garantiza que todas las explicaciones médicas se sientan claras. La sesión ofrece tiempo para hablar en español sobre la historia del niño, las preocupaciones familiares y las recomendaciones recibidas.',
      'El objetivo es complementar, no reemplazar, al pediatra de Texas. La valoración física, vacunación, prescripción, pruebas y atención urgente deben realizarse con profesionales autorizados en el lugar donde está el niño.'
    ],
    local_cards: [
      ['Lenguaje familiar y lenguaje médico', 'Aclara términos, organiza preguntas y evita que una duda importante se pierda entre traducciones o consultas breves.'],
      ['San Antonio y New Braunfels', 'La modalidad virtual también acompaña a familias de Schertz, Cibolo y otras comunidades cercanas.'],
      ['Decisiones con límites claros', 'Identifica qué puede observarse en casa y qué necesita pediatra, urgent care, especialista o emergencias en Texas.']
    ],
    faq: [
      ['¿La orientación es para familias bilingües o solo hispanohablantes?', 'Es útil para ambas. Algunas familias manejan el inglés, pero prefieren hablar en español cuando explican antecedentes, síntomas, alimentación o preocupaciones sobre el desarrollo.'],
      ['¿Puedo conectarme desde New Braunfels, Schertz o Cibolo?', 'Sí. Al ser online, la orientación está disponible para familias de esas comunidades y de otras zonas del área metropolitana de San Antonio.'],
      ['¿Sirve para revisar dudas antes de iniciar alimentación complementaria?', 'Sí. Se pueden conversar señales de preparación, seguridad, texturas, variedad y alimentación responsiva. El pediatra local debe valorar condiciones médicas o crecimiento cuando sea necesario.'],
      ['¿La doctora tiene una sede en San Antonio?', 'No. La orientación para familias de Texas se brinda desde Colombia; no existe una sede presencial de la doctora en San Antonio.'],
      ['¿Puedo solicitar una segunda opinión sobre un plan ya indicado?', 'Sí, con fines de orientación y preparación de preguntas. No debes suspender medicamentos ni modificar un plan del profesional local sin hablar con quien conoce y evalúa al niño.'],
      ['¿Se emiten recetas, órdenes o formularios para Texas?', 'No se prometen documentos válidos en Texas. Deben tramitarse con profesionales autorizados y de acuerdo con las reglas del estado.'],
      ['¿Cómo se maneja la diferencia horaria?', 'La cita se confirma en la hora local de San Antonio, incluyendo los cambios de horario estacional frente a Colombia.'],
      ['¿Qué situaciones requieren el 911?', 'Dificultad respiratoria grave, convulsiones, pérdida de conciencia, coloración azulada, lesión seria o empeoramiento rápido requieren atención de emergencia inmediata.']
    ]
  },
  {
    slug: 'pediatra-colombiana-online-en-san-diego.html',
    city: 'San Diego',
    short: 'San Diego',
    region: 'California',
    metro: 'San Diego–Chula Vista–Carlsbad',
    population: '1,1 millones',
    areas: 'San Diego, Chula Vista, National City, El Cajon, Oceanside, Escondido y otras comunidades del condado',
    title: 'Pediatra colombiana online en San Diego | En español',
    description: 'Pediatra colombiana online para familias latinas de San Diego y Chula Vista. Orientación en español sobre bebés, lactancia, sueño y desarrollo.',
    lead: 'Orientación pediátrica en español para familias del condado de San Diego que quieren organizar dudas y complementar la atención local con una conversación clara y culturalmente cercana.',
    context_title: 'Un espacio pediátrico en español para el condado de San Diego',
    context: [
      'Las familias del condado pueden recibir atención en distintos sistemas, ciudades e incluso haber acumulado documentos de varios países. La sesión ayuda a construir una historia coherente y a decidir qué información compartir con el pediatra local.',
      'La orientación no es un servicio de urgencias ni una clínica de California. Todo examen físico, vacunación, prescripción, prueba o atención aguda debe coordinarse con un profesional autorizado donde se encuentra el niño.'
    ],
    local_cards: [
      ['Historia entre sistemas de salud', 'Organiza vacunas, fórmulas, estudios y recomendaciones de Colombia, México o Estados Unidos para presentarlas con claridad al equipo local.'],
      ['Cobertura del condado', 'La modalidad acompaña a familias de San Diego, Chula Vista, National City, El Cajon, Oceanside, Escondido y zonas cercanas.'],
      ['Preparación antes de la cita', 'Termina con preguntas priorizadas y una lista de datos que conviene llevar al pediatra o especialista de California.']
    ],
    faq: [
      ['¿La orientación está disponible para Chula Vista y otras ciudades del condado?', 'Sí. Pueden solicitarla familias de Chula Vista, National City, El Cajon, Oceanside, Escondido y otras comunidades, siempre en modalidad online.'],
      ['¿Puedo organizar registros médicos de más de un país?', 'Sí. Puedes reunir vacunas, mediciones, informes y tratamientos previos para construir una cronología. La validación oficial de documentos corresponde a las instituciones locales.'],
      ['¿La sesión sirve para dudas sobre lactancia o alimentación de un bebé?', 'Sí. Se revisan antecedentes, tomas, pañales, pesos y prácticas familiares. En bebés pequeños, la ganancia de peso y cualquier signo de enfermedad requieren seguimiento presencial cercano.'],
      ['¿La Dra. Jazmín atiende presencialmente en San Diego?', 'No. Para San Diego el servicio es orientación online desde Colombia. No se presenta como consultorio ni práctica médica local en California.'],
      ['¿Puedo consultar si ya tengo pediatra en San Diego?', 'Sí. La orientación puede complementar ese cuidado, ayudarte a preparar preguntas y entender recomendaciones, sin sustituir la relación con el pediatra que examina a tu hijo.'],
      ['¿Puede emitir una receta para una farmacia de California?', 'No se promete prescripción, orden o certificado válido en California. La emisión depende de licencias, normas locales y del tipo de valoración requerida.'],
      ['¿La cita se confirma con la hora del Pacífico?', 'Sí. Recibirás la hora local de San Diego, teniendo en cuenta que la diferencia con Colombia puede variar durante el año.'],
      ['¿Qué hago ante una urgencia en San Diego?', 'Si hay dificultad respiratoria, convulsiones, pérdida de conciencia, coloración azulada, lesión grave o deterioro rápido, llama al 911 o acude a emergencias sin esperar la consulta online.']
    ]
  }
].freeze

SERVICE_CARDS = [
  ['Recién nacidos y primeros meses', 'Alimentación, pañales, sueño, adaptación familiar y señales que requieren control presencial.', 'preparacion-recien-nacido.html', 'assets/img/services/preparacion-recien-nacido.webp'],
  ['Lactancia materna', 'Agarre, dolor, producción percibida, extracción, regreso al trabajo y seguimiento del bebé.', 'asesoria-lactancia-materna.html', 'assets/img/services/asesoria-lactancia-materna.webp'],
  ['Sueño infantil', 'Rutinas, despertares, siestas y revisión de señales médicas que no deben tratarse solo como hábitos.', 'asesoria-sueno-infantil.html', 'assets/img/services/asesoria-sueno-infantil.webp'],
  ['Alimentación complementaria', 'Inicio de alimentos, texturas, variedad, seguridad y alimentación responsiva según el desarrollo.', 'alimentacion-complementaria.html', 'assets/img/services/alimentacion-complementaria.webp'],
  ['Crecimiento y desarrollo', 'Organización de mediciones, hitos, lenguaje, conducta y preguntas para el seguimiento local.', 'seguimiento-neurodesarrollo-infantil.html', 'assets/img/services/neurodesarrollo-infantil.webp'],
  ['Segunda opinión informativa', 'Revisión de antecedentes y documentos para comprender recomendaciones y preparar preguntas.', 'teleconsulta-pediatrica.html', 'assets/img/services/teleconsulta-pediatrica.webp']
].freeze

def h(value)
  CGI.escapeHTML(value.to_s)
end

def whatsapp_url(city)
  text = "Hola Dra. Jazmín, quiero orientación pediátrica online en español desde #{city}"
  "https://wa.me/#{PHONE}?text=#{URI.encode_www_form_component(text)}"
end

def schemas_for(metro)
  canonical = "#{BASE_URL}/#{metro[:slug]}"
  physician_id = "#{BASE_URL}/#dra-jazmin-prada"
  service_id = "#{canonical}#servicio"
  faq = metro[:faq].map do |question, answer|
    {
      '@type' => 'Question',
      'name' => question,
      'acceptedAnswer' => { '@type' => 'Answer', 'text' => answer }
    }
  end

  {
    '@context' => 'https://schema.org',
    '@graph' => [
      {
        '@type' => 'MedicalWebPage',
        '@id' => "#{canonical}#webpage",
        'url' => canonical,
        'name' => metro[:title],
        'description' => metro[:description],
        'inLanguage' => 'es',
        'dateModified' => UPDATED_ISO,
        'lastReviewed' => UPDATED_ISO,
        'author' => { '@id' => physician_id },
        'reviewedBy' => { '@id' => physician_id },
        'mainEntity' => { '@id' => service_id },
        'about' => [
          { '@type' => 'Thing', 'name' => 'Pediatría' },
          { '@type' => 'Thing', 'name' => 'Orientación pediátrica online en español' }
        ]
      },
      {
        '@type' => 'Physician',
        '@id' => physician_id,
        'name' => 'Dra. Jazmín Prada',
        'medicalSpecialty' => 'Pediatrics',
        'image' => "#{BASE_URL}/assets/img/dra-jazmin-prada.jpg",
        'telephone' => "+#{PHONE}",
        'url' => "#{BASE_URL}/",
        'address' => {
          '@type' => 'PostalAddress',
          'addressLocality' => 'Bogotá',
          'addressCountry' => 'CO'
        },
        'sameAs' => ['https://www.instagram.com/drajazminpradapediatra']
      },
      {
        '@type' => 'Service',
        '@id' => service_id,
        'name' => "Orientación pediátrica online en español para familias en #{metro[:city]}",
        'serviceType' => 'Orientación pediátrica online en español',
        'provider' => { '@id' => physician_id },
        'url' => canonical,
        'areaServed' => {
          '@type' => 'Place',
          'name' => "#{metro[:metro]}, Estados Unidos"
        },
        'availableChannel' => {
          '@type' => 'ServiceChannel',
          'serviceUrl' => canonical,
          'servicePhone' => "+#{PHONE}"
        }
      },
      {
        '@type' => 'BreadcrumbList',
        '@id' => "#{canonical}#breadcrumb",
        'itemListElement' => [
          { '@type' => 'ListItem', 'position' => 1, 'name' => 'Pediatra Colombia', 'item' => "#{BASE_URL}/" },
          { '@type' => 'ListItem', 'position' => 2, 'name' => metro[:title], 'item' => canonical }
        ]
      },
      {
        '@type' => 'FAQPage',
        '@id' => "#{canonical}#faq",
        'mainEntity' => faq
      }
    ]
  }
end

def render_page(metro)
  canonical = "#{BASE_URL}/#{metro[:slug]}"
  wa_url = whatsapp_url(metro[:city])
  other_metros = METROS.reject { |item| item[:slug] == metro[:slug] }

  services_html = SERVICE_CARDS.map do |name, description, link, image|
    <<~HTML
      <article class="service-card">
        <img src="#{h(image)}" width="720" height="480" loading="lazy" alt="#{h(name)}: orientación pediátrica online en español">
        <div class="service-copy">
          <h3>#{h(name)}</h3>
          <p>#{h(description)}</p>
          <a href="#{h(link)}">Conocer este servicio <span aria-hidden="true">→</span></a>
        </div>
      </article>
    HTML
  end.join

  local_cards_html = metro[:local_cards].map.with_index do |(title, copy), index|
    <<~HTML
      <article class="local-card">
        <span class="number" aria-hidden="true">0#{index + 1}</span>
        <h3>#{h(title)}</h3>
        <p>#{h(copy)}</p>
      </article>
    HTML
  end.join

  faq_html = metro[:faq].map do |question, answer|
    <<~HTML
      <details>
        <summary>#{h(question)}</summary>
        <div class="faq-answer"><p>#{h(answer)}</p></div>
      </details>
    HTML
  end.join

  metro_links = other_metros.map do |item|
    %(<a href="#{h(item[:slug])}">#{h(item[:short])}</a>)
  end.join

  <<~HTML
    <!doctype html>
    <html lang="es">
    <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="robots" content="index,follow,max-image-preview:large,max-snippet:-1,max-video-preview:-1">
      <meta name="author" content="Dra. Jazmín Prada">
      <meta name="theme-color" content="#264653">
      <title>#{h(metro[:title])}</title>
      <meta name="description" content="#{h(metro[:description])}">
      <link rel="canonical" href="#{h(canonical)}">
      <link rel="icon" type="image/png" href="assets/img/logo.png">
      <meta property="og:locale" content="es_CO">
      <meta property="og:type" content="website">
      <meta property="og:title" content="#{h(metro[:title])}">
      <meta property="og:description" content="#{h(metro[:description])}">
      <meta property="og:url" content="#{h(canonical)}">
      <meta property="og:site_name" content="Pediatra Colombia">
      <meta property="og:image" content="#{BASE_URL}/og-image.jpg">
      <meta property="og:image:width" content="1200">
      <meta property="og:image:height" content="630">
      <meta property="og:image:alt" content="Dra. Jazmín Prada, pediatra colombiana">
      <meta name="twitter:card" content="summary_large_image">
      <meta name="twitter:title" content="#{h(metro[:title])}">
      <meta name="twitter:description" content="#{h(metro[:description])}">
      <meta name="twitter:image" content="#{BASE_URL}/og-image.jpg">
      <link rel="preconnect" href="https://fonts.googleapis.com">
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
      <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700&amp;family=Playfair+Display:wght@600;700&amp;display=swap" rel="stylesheet">
      <script async src="https://www.googletagmanager.com/gtag/js?id=G-NJD0RZJ6J6"></script>
      <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());
        gtag('config', 'G-NJD0RZJ6J6');
      </script>
      <script type="application/ld+json">#{JSON.generate(schemas_for(metro))}</script>
      <script src="https://analytics.ahrefs.com/analytics.js" data-key="Hcp8Yq4SzCpQtmsD1sTdqA" async></script>
      <style>
        :root{--navy:#264653;--navy-dark:#19343e;--teal:#2a9d8f;--teal-dark:#1f7a6f;--teal-pale:#e6f5f3;--coral:#e76f51;--coral-dark:#d4553a;--ink:#34434d;--muted:#63717b;--paper:#f8faf9;--white:#fff;--line:rgba(38,70,83,.14);--shadow:0 18px 55px rgba(25,52,62,.10)}
        *{box-sizing:border-box}
        html{scroll-behavior:smooth}
        body{margin:0;background:var(--paper);color:var(--ink);font-family:"DM Sans",sans-serif;line-height:1.65}
        img{display:block;max-width:100%}
        a{color:inherit}
        .container{width:min(1120px,calc(100% - 32px));margin-inline:auto}
        .site-header{position:sticky;top:0;z-index:50;background:rgba(255,255,255,.96);backdrop-filter:blur(14px);border-bottom:1px solid var(--line)}
        .nav{min-height:76px;display:flex;align-items:center;justify-content:space-between;gap:24px}
        .brand img{width:150px;height:auto}
        .nav-links{display:flex;align-items:center;gap:24px;font-size:.92rem;font-weight:600}
        .nav-links a{text-decoration:none}
        .nav-links a:hover{color:var(--teal-dark)}
        .button{display:inline-flex;align-items:center;justify-content:center;gap:8px;border-radius:999px;padding:13px 21px;background:var(--coral);color:white;text-decoration:none;font-weight:700;box-shadow:0 10px 24px rgba(231,111,81,.24);transition:.2s ease}
        .button:hover{background:var(--coral-dark);transform:translateY(-1px)}
        .button.secondary{background:white;color:var(--navy);border:1px solid var(--line);box-shadow:none}
        .button.secondary:hover{border-color:var(--teal);color:var(--teal-dark)}
        .button.small{padding:10px 16px;font-size:.9rem}
        .hero{position:relative;overflow:hidden;padding:76px 0 70px;background:radial-gradient(circle at 15% 12%,rgba(42,157,143,.19),transparent 31%),radial-gradient(circle at 88% 18%,rgba(231,111,81,.13),transparent 28%),linear-gradient(135deg,#eef9f7,#fff 58%,#e3f0ed)}
        .hero:after{content:"";position:absolute;right:-90px;bottom:-160px;width:390px;height:390px;border:70px solid rgba(42,157,143,.08);border-radius:50%}
        .hero-grid{display:grid;grid-template-columns:1.18fr .82fr;align-items:center;gap:60px;position:relative;z-index:1}
        .eyebrow{display:inline-flex;align-items:center;gap:8px;background:var(--teal-pale);color:var(--teal-dark);padding:7px 12px;border-radius:999px;font-size:.79rem;font-weight:700;letter-spacing:.02em}
        h1,h2,h3{font-family:"Playfair Display",serif;color:var(--navy);line-height:1.18;margin-top:0}
        h1{font-size:clamp(2.45rem,5vw,4.4rem);margin:20px 0 20px;letter-spacing:-.035em}
        h2{font-size:clamp(2rem,3.6vw,3.15rem);letter-spacing:-.025em;margin-bottom:16px}
        h3{font-size:1.25rem;margin-bottom:9px}
        .hero-lead{font-size:1.12rem;max-width:680px;color:#455863;margin-bottom:26px}
        .hero-actions{display:flex;flex-wrap:wrap;gap:12px}
        .hero-notes{display:flex;flex-wrap:wrap;gap:18px;margin-top:24px;font-size:.82rem;color:var(--muted)}
        .doctor-card{position:relative;background:white;border:1px solid var(--line);border-radius:32px;padding:24px;box-shadow:var(--shadow)}
        .doctor-card:before{content:"";position:absolute;inset:-12px 15px 12px -15px;border:1px solid rgba(42,157,143,.25);border-radius:35px;z-index:-1;transform:rotate(-2deg)}
        .doctor-card img{width:100%;aspect-ratio:4/3;object-fit:cover;object-position:center 28%;border-radius:22px}
        .doctor-caption{display:flex;justify-content:space-between;align-items:end;gap:20px;padding:18px 4px 2px}
        .doctor-caption strong{display:block;color:var(--navy);font-size:1.05rem}
        .doctor-caption span{font-size:.82rem;color:var(--muted)}
        .metro-stat{text-align:right;color:var(--teal-dark);font-weight:700;font-size:.9rem}
        .metro-stat small{display:block;color:var(--muted);font-weight:500}
        .trust{background:var(--navy);color:white}
        .trust-grid{display:grid;grid-template-columns:repeat(4,1fr);gap:1px;background:rgba(255,255,255,.12)}
        .trust-item{padding:22px;text-align:center;background:var(--navy)}
        .trust-item strong{display:block;font-size:.92rem}
        .trust-item span{display:block;font-size:.76rem;color:rgba(255,255,255,.67);margin-top:3px}
        section{padding:82px 0}
        section.white{background:white}
        .section-head{max-width:760px;margin:0 auto 42px;text-align:center}
        .section-head .kicker{display:block;color:var(--teal-dark);font-size:.78rem;font-weight:800;letter-spacing:.12em;text-transform:uppercase;margin-bottom:11px}
        .section-head p{color:var(--muted);margin:0}
        .context-grid{display:grid;grid-template-columns:.9fr 1.1fr;gap:64px;align-items:start}
        .context-copy p{font-size:1.04rem;color:#4b5c66}
        .context-copy .source-note{font-size:.8rem;color:var(--muted);margin-top:26px;padding-top:18px;border-top:1px solid var(--line)}
        .local-grid{display:grid;gap:14px}
        .local-card{position:relative;background:white;border:1px solid var(--line);border-radius:20px;padding:24px 24px 22px 76px;box-shadow:0 8px 26px rgba(25,52,62,.05)}
        .local-card .number{position:absolute;left:22px;top:22px;display:grid;place-items:center;width:38px;height:38px;border-radius:12px;background:var(--teal-pale);color:var(--teal-dark);font-weight:800}
        .local-card p{margin:0;color:var(--muted);font-size:.93rem}
        .service-grid{display:grid;grid-template-columns:repeat(3,1fr);gap:20px}
        .service-card{background:white;border:1px solid var(--line);border-radius:22px;overflow:hidden;box-shadow:0 10px 32px rgba(25,52,62,.06);transition:.2s ease}
        .service-card:hover{transform:translateY(-3px);box-shadow:var(--shadow)}
        .service-card img{width:100%;height:165px;object-fit:cover}
        .service-copy{padding:22px}
        .service-copy p{font-size:.9rem;color:var(--muted);margin:0 0 14px}
        .service-copy a{font-size:.86rem;color:var(--teal-dark);font-weight:700;text-decoration:none}
        .fit-grid{display:grid;grid-template-columns:1fr 1fr;gap:24px}
        .fit-card{border-radius:25px;padding:30px;border:1px solid var(--line)}
        .fit-card.good{background:#eef9f6}
        .fit-card.local{background:#fff4f0}
        .fit-card ul{padding:0;margin:18px 0 0;list-style:none}
        .fit-card li{position:relative;padding-left:28px;margin:11px 0;color:#4b5c66}
        .fit-card.good li:before{content:"✓";position:absolute;left:0;color:var(--teal-dark);font-weight:800}
        .fit-card.local li:before{content:"!";position:absolute;left:2px;color:var(--coral-dark);font-weight:800}
        .steps{display:grid;grid-template-columns:repeat(3,1fr);gap:22px;counter-reset:steps}
        .step{counter-increment:steps;background:white;border:1px solid var(--line);border-radius:22px;padding:28px}
        .step:before{content:counter(steps);display:grid;place-items:center;width:42px;height:42px;border-radius:14px;background:var(--navy);color:white;font-weight:800;margin-bottom:20px}
        .step p{margin:0;color:var(--muted);font-size:.93rem}
        .prep{display:grid;grid-template-columns:.8fr 1.2fr;gap:52px;align-items:center;background:var(--navy);border-radius:32px;padding:48px;color:white}
        .prep h2,.prep h3{color:white}
        .prep p{color:rgba(255,255,255,.72)}
        .checklist{display:grid;grid-template-columns:1fr 1fr;gap:12px}
        .check{background:rgba(255,255,255,.09);border:1px solid rgba(255,255,255,.12);border-radius:15px;padding:15px;font-size:.9rem}
        .about-grid{display:grid;grid-template-columns:.7fr 1.3fr;gap:48px;align-items:center}
        .about-grid img{width:100%;max-width:340px;aspect-ratio:1/1;object-fit:cover;border-radius:50%;border:10px solid var(--teal-pale);margin:auto}
        .credentials{display:flex;flex-wrap:wrap;gap:8px;margin:22px 0}
        .credentials span{background:var(--teal-pale);color:var(--teal-dark);border-radius:999px;padding:7px 11px;font-size:.8rem;font-weight:700}
        .resource-box{background:#f3f7f6;border-left:4px solid var(--teal);padding:18px 20px;border-radius:0 14px 14px 0;font-size:.88rem}
        .resource-box a{color:var(--teal-dark);font-weight:700}
        .faq-list{max-width:850px;margin:auto;display:grid;gap:12px}
        details{background:white;border:1px solid var(--line);border-radius:16px;overflow:hidden}
        summary{cursor:pointer;list-style:none;padding:19px 52px 19px 20px;font-weight:700;color:var(--navy);position:relative}
        summary::-webkit-details-marker{display:none}
        summary:after{content:"+";position:absolute;right:20px;top:14px;font-size:1.6rem;color:var(--teal-dark);font-weight:400}
        details[open] summary:after{content:"−"}
        .faq-answer{padding:0 20px 18px;color:var(--muted)}
        .faq-answer p{margin:0}
        .metro-links{display:flex;flex-wrap:wrap;justify-content:center;gap:9px;margin-top:34px}
        .metro-links a{background:white;border:1px solid var(--line);border-radius:999px;padding:8px 13px;text-decoration:none;font-size:.82rem;color:var(--navy);font-weight:600}
        .metro-links a:hover{border-color:var(--teal);color:var(--teal-dark)}
        .final-cta{background:linear-gradient(135deg,var(--navy-dark),var(--navy));color:white;text-align:center}
        .final-cta h2{color:white}
        .final-cta p{max-width:720px;margin:0 auto 26px;color:rgba(255,255,255,.74)}
        footer{background:#122d36;color:rgba(255,255,255,.72);padding:50px 0 34px}
        .footer-grid{display:grid;grid-template-columns:1.2fr .8fr .8fr;gap:38px}
        footer h3{color:white;font-size:1rem;font-family:"DM Sans",sans-serif}
        footer p,footer li{font-size:.84rem}
        footer ul{list-style:none;padding:0}
        footer a{color:inherit}
        .legal{border-top:1px solid rgba(255,255,255,.1);margin-top:34px;padding-top:20px;font-size:.76rem;color:rgba(255,255,255,.52)}
        .wa-float{position:fixed;right:20px;bottom:20px;z-index:60;display:grid;place-items:center;width:58px;height:58px;border-radius:50%;background:#20b45a;color:white;text-decoration:none;font-weight:900;font-size:.74rem;box-shadow:0 12px 30px rgba(0,0,0,.24)}
        @media(max-width:900px){
          .nav-links{display:none}
          .hero-grid,.context-grid,.prep,.about-grid{grid-template-columns:1fr}
          .hero{padding-top:58px}
          .doctor-card{max-width:520px}
          .trust-grid,.service-grid{grid-template-columns:repeat(2,1fr)}
          .steps{grid-template-columns:1fr}
          .footer-grid{grid-template-columns:1fr 1fr}
        }
        @media(max-width:620px){
          .brand img{width:124px}
          .nav .button{padding:10px 14px;font-size:.82rem}
          section{padding:64px 0}
          .hero-grid{gap:36px}
          .doctor-caption{align-items:start;flex-direction:column}
          .metro-stat{text-align:left}
          .trust-grid,.service-grid,.fit-grid,.checklist,.footer-grid{grid-template-columns:1fr}
          .trust-item{padding:17px}
          .prep{padding:30px 22px}
          .local-card{padding-left:68px}
          .wa-float{right:14px;bottom:14px}
        }
        @media(prefers-reduced-motion:reduce){html{scroll-behavior:auto}.button,.service-card{transition:none}}
      </style>
    </head>
    <body>
      <header class="site-header">
        <nav class="nav container" aria-label="Navegación principal">
          <a class="brand" href="/" aria-label="Pediatra Colombia, inicio"><img src="assets/img/logo.png" width="150" height="43" alt="Pediatra Colombia"></a>
          <div class="nav-links">
            <a href="#orientacion">Orientación</a>
            <a href="#servicios">Temas</a>
            <a href="#como-funciona">Cómo funciona</a>
            <a href="#preguntas">Preguntas</a>
          </div>
          <a class="button small" href="#{h(wa_url)}" target="_blank" rel="noopener noreferrer">Consultar disponibilidad</a>
        </nav>
      </header>

      <main>
        <section class="hero">
          <div class="hero-grid container">
            <div>
              <span class="eyebrow">Médica pediatra · orientación online en español</span>
              <h1>Pediatra colombiana online para familias en #{h(metro[:city])}</h1>
              <p class="hero-lead">#{h(metro[:lead])}</p>
              <div class="hero-actions">
                <a class="button" href="#{h(wa_url)}" target="_blank" rel="noopener noreferrer">Agendar por WhatsApp</a>
                <a class="button secondary" href="#orientacion">Conocer el alcance</a>
              </div>
              <div class="hero-notes">
                <span>✓ Atención en español</span>
                <span>✓ Desde Colombia</span>
                <span>✓ No reemplaza urgencias ni pediatra local</span>
              </div>
            </div>
            <aside class="doctor-card" aria-label="Información profesional">
              <img src="assets/img/dra-jazmin-prada.jpg" width="720" height="540" alt="Dra. Jazmín Prada, médica pediatra">
              <div class="doctor-caption">
                <div><strong>Dra. Jazmín Prada</strong><span>Médica pediatra · Universidad de Buenos Aires</span></div>
                <div class="metro-stat">#{h(metro[:population])}<small>población latina aprox. en el área metro</small></div>
              </div>
            </aside>
          </div>
        </section>

        <div class="trust" aria-label="Características del servicio">
          <div class="trust-grid container">
            <div class="trust-item"><strong>Consulta en español</strong><span>Comunicación clara y cercana</span></div>
            <div class="trust-item"><strong>Enfoque pediátrico</strong><span>Desde recién nacidos hasta adolescencia</span></div>
            <div class="trust-item"><strong>Medicina basada en evidencia</strong><span>Con fuentes y límites explícitos</span></div>
            <div class="trust-item"><strong>Área #{h(metro[:short])}</strong><span>Agenda confirmada en hora local</span></div>
          </div>
        </div>

        <section id="orientacion">
          <div class="context-grid container">
            <div class="context-copy">
              <span class="eyebrow">#{h(metro[:metro])}</span>
              <h2>#{h(metro[:context_title])}</h2>
              #{metro[:context].map { |paragraph| "<p>#{h(paragraph)}</p>" }.join}
              <p class="source-note">La cifra de población latina es una estimación metropolitana aproximada. La página describe una modalidad online desde Colombia y no una sede física en #{h(metro[:region])}.</p>
            </div>
            <div class="local-grid">#{local_cards_html}</div>
          </div>
        </section>

        <section id="servicios" class="white">
          <div class="container">
            <header class="section-head">
              <span class="kicker">Motivos frecuentes</span>
              <h2>Qué puedes conversar en una orientación pediátrica online</h2>
              <p>La pertinencia de la modalidad se revisa caso por caso. Si el motivo requiere exploración física, pruebas o atención urgente, se orienta a la familia hacia servicios locales.</p>
            </header>
            <div class="service-grid">#{services_html}</div>
          </div>
        </section>

        <section>
          <div class="container">
            <header class="section-head">
              <span class="kicker">Alcance responsable</span>
              <h2>Cuándo puede ayudar y cuándo necesitas atención local</h2>
            </header>
            <div class="fit-grid">
              <article class="fit-card good">
                <h3>Puede ser útil para orientación</h3>
                <ul>
                  <li>Preparar preguntas antes de un control o especialista.</li>
                  <li>Ordenar antecedentes, registros y recomendaciones previas.</li>
                  <li>Conversar sobre lactancia, rutinas, alimentación y desarrollo.</li>
                  <li>Comprender términos y documentos médicos en español.</li>
                  <li>Reconocer qué cambios conviene observar y registrar.</li>
                </ul>
              </article>
              <article class="fit-card local">
                <h3>Necesita atención en #{h(metro[:region])}</h3>
                <ul>
                  <li>Urgencias, síntomas intensos o deterioro rápido.</li>
                  <li>Examen físico, vacunación, procedimientos o pruebas.</li>
                  <li>Recetas, certificados u órdenes válidas en Estados Unidos.</li>
                  <li>Seguimiento de recién nacidos o enfermedades que exige presencia.</li>
                  <li>Cualquier situación que el pediatra local indique revisar.</li>
                </ul>
              </article>
            </div>
          </div>
        </section>

        <section id="como-funciona" class="white">
          <div class="container">
            <header class="section-head">
              <span class="kicker">Proceso sencillo</span>
              <h2>Cómo solicitar orientación desde #{h(metro[:city])}</h2>
            </header>
            <div class="steps">
              <article class="step"><h3>Cuéntanos el motivo</h3><p>Escribe por WhatsApp, indica la edad del niño, tu ubicación y qué deseas revisar. Si parece una emergencia, busca ayuda local inmediatamente.</p></article>
              <article class="step"><h3>Confirma horario y documentos</h3><p>Recibirás la hora expresada en #{h(metro[:short])} y una indicación breve sobre los datos o documentos útiles para la sesión.</p></article>
              <article class="step"><h3>Conéctate desde un lugar tranquilo</h3><p>Un adulto responsable debe participar. Al finalizar tendrás preguntas y próximos pasos para coordinar con el equipo local cuando corresponda.</p></article>
            </div>
          </div>
        </section>

        <section>
          <div class="prep container">
            <div>
              <span class="eyebrow">Antes de conectarte</span>
              <h2>Prepara una consulta más clara</h2>
              <p>No necesitas reunir todo. Empieza por la preocupación principal y los datos más recientes.</p>
            </div>
            <div class="checklist">
              <div class="check">Edad, peso y talla recientes</div>
              <div class="check">Lista de medicamentos y alergias</div>
              <div class="check">Vacunas, informes o resultados relevantes</div>
              <div class="check">Cronología breve del motivo de consulta</div>
              <div class="check">Fotos o videos solo si se solicitan</div>
              <div class="check">Tres preguntas prioritarias</div>
            </div>
          </div>
        </section>

        <section class="white">
          <div class="about-grid container">
            <img src="assets/img/dra-jazmin-prada.jpg" width="500" height="500" loading="lazy" alt="Dra. Jazmín Prada, pediatra colombiana">
            <div>
              <span class="eyebrow">Quién orienta el contenido</span>
              <h2>Dra. Jazmín Prada</h2>
              <p>Médica pediatra formada en la Universidad de Buenos Aires. Acompaña a familias dentro y fuera de Colombia con una comunicación cercana, una mirada integral del niño y decisiones guiadas por evidencia.</p>
              <p>Para familias en #{h(metro[:areas])}, la modalidad es exclusivamente online desde Colombia. Esta transparencia protege la continuidad con el pediatra y los servicios autorizados en Estados Unidos.</p>
              <div class="credentials"><span>Médica pediatra</span><span>Universidad de Buenos Aires</span><span>Atención en español</span></div>
              <div class="resource-box">Fuentes para familias: <a href="https://www.healthychildren.org/English/tips-tools/ask-the-pediatrician/Pages/Can-video-visits-be-good-for-my-child.aspx" target="_blank" rel="noopener noreferrer">telemedicina pediátrica · American Academy of Pediatrics</a> y <a href="https://telehealth.hhs.gov/licensure/licensing-across-state-lines" target="_blank" rel="noopener noreferrer">licencias para atención entre estados · HHS</a>.</div>
            </div>
          </div>
        </section>

        <section id="preguntas">
          <div class="container">
            <header class="section-head">
              <span class="kicker">Respuestas directas</span>
              <h2>Preguntas frecuentes de familias en #{h(metro[:city])}</h2>
              <p>Estas respuestas aclaran el alcance real de la orientación online y cuándo continuar con atención presencial en #{h(metro[:region])}.</p>
            </header>
            <div class="faq-list">#{faq_html}</div>
            <nav class="metro-links" aria-label="Otras ciudades de Estados Unidos">
              <a href="/">Pediatra Colombia</a>#{metro_links}
            </nav>
          </div>
        </section>

        <section class="final-cta">
          <div class="container">
            <h2>Conversa en español desde #{h(metro[:city])}</h2>
            <p>Escribe el motivo principal y la edad de tu hijo para confirmar si una orientación online es apropiada. Si hay una urgencia, llama al 911 o acude al servicio local más cercano.</p>
            <a class="button" href="#{h(wa_url)}" target="_blank" rel="noopener noreferrer">Consultar disponibilidad por WhatsApp</a>
          </div>
        </section>
      </main>

      <footer>
        <div class="container">
          <div class="footer-grid">
            <div><h3>Pediatra Colombia</h3><p>Dra. Jazmín Prada · Médica pediatra formada en la Universidad de Buenos Aires.</p><p>Orientación online en español para familias en #{h(metro[:city])}; atención presencial únicamente en Bogotá.</p></div>
            <div><h3>Servicios</h3><ul><li><a href="consulta-pediatrica-general.html">Consulta pediátrica general</a></li><li><a href="asesoria-lactancia-materna.html">Lactancia materna</a></li><li><a href="asesoria-sueno-infantil.html">Sueño infantil</a></li><li><a href="alimentacion-complementaria.html">Alimentación complementaria</a></li></ul></div>
            <div><h3>Contacto</h3><p><a href="#{h(wa_url)}" target="_blank" rel="noopener noreferrer">WhatsApp +#{PHONE}</a></p><p><a href="https://www.instagram.com/drajazminpradapediatra" target="_blank" rel="noopener noreferrer">@drajazminpradapediatra</a></p></div>
          </div>
          <div class="legal">
            <p>Contenido revisado el <time datetime="#{UPDATED_ISO}">#{UPDATED_HUMAN}</time>. Información educativa y orientación general: no sustituye una valoración médica presencial, el pediatra local ni la atención de urgencias. La posibilidad de prestar servicios clínicos, prescribir o emitir documentos depende de la ubicación del paciente y de las licencias y normas aplicables.</p>
            <p>© 2026 Pediatra Colombia · Todos los derechos reservados.</p>
          </div>
        </div>
      </footer>

      <a class="wa-float" href="#{h(wa_url)}" target="_blank" rel="noopener noreferrer" aria-label="Consultar disponibilidad por WhatsApp">WA</a>
      <script>
        document.addEventListener('click', function(event) {
          var link = event.target.closest('a[href*="wa.me/"]');
          if (link && typeof gtag === 'function') {
            gtag('event', 'generate_lead', {method: 'WhatsApp', link_url: link.href, page_path: location.pathname});
          }
        });
      </script>
    </body>
    </html>
  HTML
end

METROS.each do |metro|
  File.write(File.expand_path("../#{metro[:slug]}", __dir__), render_page(metro))
  puts "Generated #{metro[:slug]}"
end
