require 'cgi'
require 'json'

UPDATED = '2026-07-12'
PHONE = '573187022574'
BASE = 'https://pediatracolombia.com'

SERVICES = [
  {
    slug: 'consulta-pediatrica-general.html',
    name: 'Consulta Pediátrica General',
    title: 'Consulta Pediátrica General | Dra. Jazmín Prada',
    description: 'Consulta pediátrica general para revisar crecimiento, desarrollo, síntomas frecuentes, prevención y dudas de crianza. Atención virtual y opciones presenciales en Bogotá.',
    eyebrow: 'Cuidado integral en cada etapa',
    lead: 'Un espacio para revisar la salud del niño de forma integral, escuchar las preocupaciones de la familia y organizar un plan acorde con su edad, antecedentes y evolución.',
    intro: 'La consulta general no se limita a un síntoma. Permite integrar crecimiento, alimentación, sueño, vacunas, desarrollo, antecedentes y contexto familiar. Según el motivo, puede comenzar virtualmente o requerir examen físico presencial.',
    suitable: ['Controles de crecimiento y desarrollo', 'Dudas sobre síntomas frecuentes que no son una emergencia', 'Revisión de antecedentes, exámenes o fórmulas previas', 'Prevención, vacunas y hábitos saludables', 'Segunda opinión y organización del seguimiento'],
    covers: ['Motivo principal y tiempo de evolución', 'Peso, talla y trayectoria de crecimiento cuando hay datos disponibles', 'Alimentación, sueño, actividad y eliminación', 'Hitos del desarrollo y comportamiento', 'Vacunación, antecedentes personales y familiares', 'Necesidad de valoración presencial, pruebas o remisión'],
    prepare: ['Escribe tus tres a cinco preguntas principales.', 'Ten disponibles carné de vacunas, mediciones, exámenes y fórmulas.', 'Anota medicamentos, alergias y cambios recientes.', 'Si es virtual, busca buena luz y conexión estable.'],
    limits: 'Los controles completos, vacunas, pruebas, procedimientos y síntomas que necesitan exploración física deben resolverse presencialmente. Una emergencia nunca debe esperar una cita virtual.',
    source_url: 'https://www.healthychildren.org/English/family-life/health-management/Pages/Well-Child-Care-A-Check-Up-for-Success.aspx',
    source_name: 'Controles pediátricos preventivos · American Academy of Pediatrics',
    faqs: [
      ['¿La consulta general sirve aunque mi hijo no esté enfermo?', 'Sí. Los controles preventivos permiten conversar sobre crecimiento, desarrollo, vacunas, alimentación, sueño, seguridad y dudas propias de cada edad.'],
      ['¿Puede hacerse por teleconsulta?', 'Algunos seguimientos y orientaciones pueden comenzar virtualmente. Si el motivo exige examen físico, vacunas, pruebas o un control completo, se recomendará atención presencial.'],
      ['¿Qué documentos debo llevar?', 'Carné de vacunas, exámenes, fórmulas, lista de medicamentos y registros recientes de peso o talla pueden aportar contexto, pero no todos son obligatorios.'],
      ['¿La consulta reemplaza urgencias?', 'No. Dificultad respiratoria, convulsiones, pérdida de conciencia, dolor intenso, deshidratación o deterioro rápido requieren atención presencial inmediata.']
    ]
  },
  {
    slug: 'asesoria-lactancia-materna.html',
    name: 'Asesoría de Lactancia Materna',
    title: 'Asesoría de Lactancia Materna | Pediatra Online',
    description: 'Asesoría pediátrica de lactancia materna durante embarazo y posparto: agarre, dolor, producción percibida, extracción, regreso al trabajo y seguimiento del bebé.',
    eyebrow: 'Acompañamiento respetuoso y práctico',
    lead: 'Orientación individual para comprender lo que ocurre durante la lactancia, cuidar a la madre y vigilar que el bebé se alimente y crezca adecuadamente.',
    intro: 'La lactancia cambia con la edad del bebé, la recuperación materna y la dinámica familiar. La asesoría revisa objetivos, dificultades, antecedentes y señales del bebé sin imponer una única forma de alimentar.',
    suitable: ['Preparación durante el embarazo', 'Dolor, grietas o dificultad de agarre', 'Dudas sobre producción o transferencia de leche', 'Extracción y conservación de leche', 'Regreso al trabajo o separación temporal', 'Lactancia mixta, destete y cambios de etapa'],
    covers: ['Historia del embarazo, parto y primeros días', 'Frecuencia y duración de tomas', 'Pañales, comportamiento y evolución del peso', 'Posición y agarre cuando pueden observarse', 'Uso de extractor, biberón o suplementación', 'Bienestar materno y metas familiares'],
    prepare: ['Ten a mano registros de peso y controles del bebé.', 'Anota frecuencia de tomas y pañales si los has observado.', 'Prepara extractor o elementos que quieras revisar.', 'En consulta virtual, procura que madre y bebé puedan verse con buena luz.'],
    limits: 'Dolor intenso, fiebre materna, bebé muy somnoliento, rechazo persistente del alimento, pocos pañales o mala ganancia de peso pueden necesitar valoración presencial oportuna.',
    source_url: 'https://www.who.int/publications/i/item/9789240032323',
    source_name: 'Consejería en lactancia · OMS y UNICEF',
    faqs: [
      ['¿Puedo consultar antes de que nazca el bebé?', 'Sí. La preparación prenatal permite conversar sobre expectativas, primeras tomas, contacto temprano, señales de hambre y red de apoyo.'],
      ['¿Una asesoría virtual permite observar el agarre?', 'La videollamada puede aportar información sobre posición y agarre, aunque algunas dificultades requieren examen presencial de la madre y el bebé.'],
      ['¿La asesoría obliga a mantener lactancia exclusiva?', 'No. La orientación debe respetar la situación clínica, las decisiones y las posibilidades de cada familia, priorizando una alimentación segura y el bienestar de madre y bebé.'],
      ['¿Qué señales requieren consulta presencial?', 'Dolor severo, fiebre, lesión importante, deshidratación, somnolencia marcada o preocupación por el peso requieren una valoración clínica oportuna.']
    ]
  },
  {
    slug: 'asesoria-sueno-infantil.html',
    name: 'Asesoría de Sueño Infantil',
    title: 'Asesoría de Sueño Infantil | Pediatra Online',
    description: 'Asesoría de sueño infantil para revisar rutinas, despertares, siestas, horarios y señales que requieren evaluación médica, con un enfoque respetuoso por edad.',
    eyebrow: 'Sueño según edad y contexto familiar',
    lead: 'Una evaluación de hábitos y rutinas para comprender el patrón de sueño del niño, ajustar expectativas y detectar cuándo un problema necesita valoración médica.',
    intro: 'El sueño infantil cambia durante el desarrollo. La asesoría revisa horarios, siestas, ambiente, alimentación, salud y dinámica familiar; no ofrece fórmulas idénticas para todos ni promete noches sin despertares.',
    suitable: ['Dificultad para iniciar el sueño', 'Despertares frecuentes', 'Siestas muy cortas o irregulares', 'Rutinas difíciles de sostener', 'Cambios por viajes, guardería o regreso al trabajo', 'Dudas sobre sueño seguro y hábitos por edad'],
    covers: ['Horario de levantarse, siestas y acostarse', 'Rutina previa al sueño y asociaciones', 'Ambiente, luz, ruido y pantallas', 'Alimentación nocturna según edad y contexto', 'Ronquido, pausas respiratorias y síntomas médicos', 'Objetivos familiares realistas y progresivos'],
    prepare: ['Registra de tres a siete días de horarios y despertares.', 'Anota siestas, alimentación nocturna y uso de pantallas.', 'Describe dónde y cómo se duerme el niño.', 'Informa sobre ronquido, respiración ruidosa o somnolencia diurna.'],
    limits: 'Ronquido habitual, pausas respiratorias, coloración azulada, dificultad para respirar, episodios anormales o somnolencia marcada necesitan evaluación médica y no deben tratarse solo como un problema de rutina.',
    source_url: 'https://www.healthychildren.org/English/healthy-living/sleep/Pages/healthy-sleep-habits-how-many-hours-does-your-child-need.aspx',
    source_name: 'Hábitos saludables de sueño · American Academy of Pediatrics',
    faqs: [
      ['¿La asesoría utiliza un método único?', 'No. Las recomendaciones se adaptan a la edad, salud, temperamento, espacio de sueño y posibilidades reales de la familia.'],
      ['¿Es normal que un bebé se despierte?', 'Los despertares pueden formar parte del desarrollo, especialmente en bebés. La evaluación ayuda a distinguir variaciones esperables de problemas que merecen estudio.'],
      ['¿Debo llevar un registro de sueño?', 'Es útil, aunque no obligatorio. Registrar varios días permite reconocer patrones y evitar conclusiones basadas en una sola noche.'],
      ['¿Cuándo se necesita valoración presencial?', 'Ronquido persistente, pausas respiratorias, movimientos extraños, dificultad respiratoria o impacto importante durante el día requieren evaluación clínica.']
    ]
  },
  {
    slug: 'alimentacion-complementaria.html',
    name: 'Alimentación Complementaria',
    title: 'Alimentación Complementaria | Asesoría Pediátrica',
    description: 'Asesoría pediátrica para iniciar y acompañar la alimentación complementaria: preparación, texturas, variedad, alimentación responsiva, seguridad y dudas familiares.',
    eyebrow: 'Primeros alimentos con seguridad',
    lead: 'Acompañamiento para iniciar y avanzar la alimentación complementaria de acuerdo con el desarrollo del bebé, su historia clínica y las prácticas de la familia.',
    intro: 'La alimentación complementaria es el proceso de añadir alimentos cuando la leche por sí sola deja de cubrir todas las necesidades. No consiste únicamente en elegir purés o trozos: incluye seguridad, variedad, texturas, señales de hambre y saciedad y evolución del crecimiento.',
    suitable: ['Preparación para comenzar alrededor de los seis meses', 'Elección de alimentos, texturas y utensilios', 'Dudas entre triturados, trozos o enfoque mixto', 'Introducción progresiva de variedad', 'Prevención de atragantamiento y seguridad en la mesa', 'Seguimiento de aceptación y crecimiento'],
    covers: ['Señales de preparación y desarrollo', 'Historia de crecimiento y alimentación previa', 'Consistencias y progresión de texturas', 'Alimentos variados y densos en nutrientes', 'Alimentación responsiva sin presión', 'Higiene, postura y prevención de accidentes'],
    prepare: ['Anota qué alimentos y texturas ha probado.', 'Ten disponibles peso y talla recientes si existen.', 'Describe horarios, leche materna o fórmula y dinámica de comidas.', 'Comparte antecedentes de alergia, prematuridad o dificultades para tragar.'],
    limits: 'Tos o ahogo repetido al comer, pérdida de peso, vómito persistente, reacción alérgica, dolor o dificultad para tragar requieren valoración médica y, según el caso, atención presencial.',
    source_url: 'https://www.who.int/publications/i/item/9789240081864',
    source_name: 'Guía de alimentación complementaria 6–23 meses · OMS',
    faqs: [
      ['¿A qué edad suele comenzar?', 'La OMS sitúa generalmente el inicio alrededor de los seis meses, pero la decisión también considera desarrollo, salud y recomendaciones individuales.'],
      ['¿Debo escoger entre purés o BLW?', 'No necesariamente. Pueden utilizarse diferentes consistencias y un enfoque mixto, siempre que sean apropiados para el desarrollo y se cuide la seguridad.'],
      ['¿La leche deja de ser importante al iniciar alimentos?', 'No. Los alimentos se incorporan de forma complementaria y la alimentación láctea continúa durante esta transición.'],
      ['¿Qué hago si el bebé rechaza un alimento?', 'El rechazo inicial puede ocurrir. Se revisan textura, ambiente, exposición repetida y señales del bebé sin forzar la alimentación.']
    ]
  },
  {
    slug: 'conducta-alimentaria-infantil.html',
    name: 'Problemas de Conducta Alimentaria',
    title: 'Conducta Alimentaria Infantil | Asesoría Pediátrica',
    description: 'Consulta pediátrica por selectividad, rechazo de alimentos, comidas conflictivas, poco apetito y dificultades de conducta alimentaria infantil.',
    eyebrow: 'Comidas con menos presión y más claridad',
    lead: 'Evaluación de la relación del niño con los alimentos, las rutinas familiares y las señales que pueden indicar una dificultad médica, sensorial o del desarrollo.',
    intro: 'Comer es una habilidad que integra apetito, desarrollo, experiencia sensorial, aprendizaje y dinámica familiar. La consulta busca comprender el patrón completo antes de proponer cambios, evitando culpar al niño o a sus cuidadores.',
    suitable: ['Selectividad o repertorio muy limitado', 'Rechazo persistente de nuevas texturas', 'Comidas prolongadas o conflictivas', 'Dependencia de pantallas para comer', 'Preocupación por poco apetito', 'Dudas sobre porciones, horarios y límites'],
    covers: ['Historia de alimentación desde los primeros meses', 'Alimentos aceptados, rechazados y cambios recientes', 'Horarios, duración y ambiente de las comidas', 'Crecimiento, síntomas digestivos y salud oral', 'Habilidades para masticar y tragar', 'Señales sensoriales, conductuales o del desarrollo'],
    prepare: ['Lleva un registro de varios días, sin modificar la rutina.', 'Anota alimentos aceptados y presentaciones toleradas.', 'Describe dónde come, con quién y cuánto dura la comida.', 'Informa si hay tos, dolor, vómito, estreñimiento o pérdida de peso.'],
    limits: 'Pérdida de peso, deshidratación, dolor, atragantamiento, dificultad para tragar, vómito persistente o una dieta extremadamente restringida requieren evaluación clínica y posiblemente trabajo interdisciplinario.',
    source_url: 'https://www.healthychildren.org/English/healthy-living/nutrition/pages/How-To-Please-Fussy-Eaters.aspx',
    source_name: 'Orientación para alimentación selectiva · American Academy of Pediatrics',
    faqs: [
      ['¿Ser selectivo siempre significa enfermedad?', 'No. Cierta selectividad puede aparecer durante el desarrollo, pero su intensidad, duración, impacto nutricional y estrés familiar ayudan a definir si necesita evaluación.'],
      ['¿Conviene obligar a probar?', 'La presión suele aumentar el conflicto. Se busca ofrecer estructura, oportunidades de aprendizaje y límites consistentes sin forzar ni castigar.'],
      ['¿Se revisa el crecimiento?', 'Sí. La trayectoria de peso y talla aporta contexto y ayuda a distinguir preferencias manejables de situaciones con riesgo nutricional.'],
      ['¿Puede necesitar otros profesionales?', 'Sí. Según los hallazgos puede ser útil coordinar nutrición, fonoaudiología, terapia ocupacional, odontología, gastroenterología u otras áreas.']
    ]
  },
  {
    slug: 'preparacion-recien-nacido.html',
    name: 'Preparación para Recién Nacido',
    title: 'Preparación para Recién Nacido | Consulta Pediátrica',
    description: 'Consulta de preparación para la llegada del recién nacido: primeras horas, alimentación, sueño seguro, cuidados cotidianos, controles y señales de alarma.',
    eyebrow: 'Llegar a casa con un plan claro',
    lead: 'Una consulta prenatal para conversar sobre los primeros días, anticipar decisiones y ayudar a que la familia reconozca cuidados básicos y señales que requieren atención.',
    intro: 'Prepararse no significa controlar todo lo que ocurrirá. Significa conocer lo esencial, organizar apoyos, aclarar dudas y saber dónde buscar ayuda durante una etapa de muchos cambios.',
    suitable: ['Familias que esperan su primer bebé', 'Preparación después de una experiencia previa difícil', 'Dudas sobre lactancia o alimentación inicial', 'Organización del espacio de sueño', 'Cuidados de piel, cordón y baño', 'Planificación del primer control pediátrico'],
    covers: ['Qué esperar durante los primeros días', 'Alimentación y señales de hambre', 'Sueño seguro y ambiente del bebé', 'Pañales, cordón, piel y temperatura', 'Red de apoyo y recuperación familiar', 'Controles, vacunas y señales de alarma'],
    prepare: ['Anota las dudas de quienes cuidarán al bebé.', 'Comparte antecedentes relevantes del embarazo.', 'Revisa qué apoyos estarán disponibles al llegar a casa.', 'Ten a mano recomendaciones del equipo obstétrico si ya las recibiste.'],
    limits: 'La preparación prenatal no reemplaza el examen del recién nacido ni su primer control. Fiebre, dificultad respiratoria, rechazo del alimento, coloración anormal o somnolencia marcada requieren atención inmediata.',
    source_url: 'https://www.healthychildren.org/English/ages-stages/prenatal/delivery-beyond/Pages/Bringing-Baby-Home.aspx',
    source_name: 'Primera semana del recién nacido · American Academy of Pediatrics',
    faqs: [
      ['¿Cuándo conviene hacer esta consulta?', 'Puede realizarse durante el embarazo, cuando la familia tenga disponibilidad para conversar y organizar los primeros días.'],
      ['¿Incluye una lista de compras?', 'Se priorizan necesidades reales y seguridad. No todo producto comercial es necesario para cuidar adecuadamente a un recién nacido.'],
      ['¿Se habla de lactancia y fórmula?', 'Sí. Se revisan principios de alimentación segura, señales del bebé y dónde buscar apoyo, respetando el contexto y las decisiones informadas de la familia.'],
      ['¿Reemplaza el primer control pediátrico?', 'No. El recién nacido necesita valoración clínica después del nacimiento según las indicaciones del equipo tratante.']
    ]
  },
  {
    slug: 'seguimiento-neurodesarrollo-infantil.html',
    name: 'Seguimiento del Neurodesarrollo',
    title: 'Seguimiento del Neurodesarrollo Infantil | Pediatra',
    description: 'Seguimiento pediátrico del neurodesarrollo infantil: movimiento, lenguaje, juego, aprendizaje, interacción y señales para evaluación temprana.',
    eyebrow: 'Observar el desarrollo a lo largo del tiempo',
    lead: 'Seguimiento de habilidades motoras, comunicación, aprendizaje, juego e interacción para comprender la trayectoria del niño y actuar temprano cuando existe una preocupación.',
    intro: 'Los hitos describen habilidades que la mayoría de los niños alcanza dentro de ciertos rangos. No son una competencia ni un diagnóstico por sí solos; se interpretan junto con antecedentes, salud, oportunidades de aprendizaje y evolución.',
    suitable: ['Seguimiento rutinario de hitos', 'Dudas sobre lenguaje o comunicación', 'Preocupaciones motoras', 'Cambios en juego o interacción social', 'Antecedentes de prematuridad o riesgo', 'Revisión de informes escolares o terapéuticos'],
    covers: ['Antecedentes de embarazo, nacimiento y salud', 'Movimiento fino y grueso', 'Lenguaje y comunicación', 'Juego, aprendizaje y resolución de problemas', 'Interacción, conducta y autonomía', 'Necesidad de tamizaje, evaluación o remisión'],
    prepare: ['Anota habilidades nuevas y preocupaciones concretas.', 'Prepara videos espontáneos si muestran una conducta difícil de observar en consulta.', 'Ten informes de terapias, jardín o colegio si existen.', 'Evita entrenar al niño para demostrar una habilidad específica.'],
    limits: 'La observación virtual puede apoyar el seguimiento, pero no reemplaza herramientas estandarizadas ni evaluaciones presenciales cuando existe sospecha de retraso, regresión o alteración neurológica.',
    source_url: 'https://www.cdc.gov/milestones',
    source_name: 'Hitos del desarrollo infantil · CDC',
    faqs: [
      ['¿Todos los niños alcanzan los hitos a la misma edad?', 'No. Existe variación individual, pero los rangos orientan la vigilancia y ayudan a reconocer cuándo conviene evaluar con mayor profundidad.'],
      ['¿Qué es una regresión?', 'Es la pérdida de una habilidad que el niño ya utilizaba. Debe comunicarse oportunamente al profesional de salud para definir la evaluación necesaria.'],
      ['¿La teleconsulta sirve para el seguimiento?', 'Puede permitir conversar, revisar antecedentes y observar juego o interacción, pero algunas preocupaciones requieren evaluación presencial y herramientas específicas.'],
      ['¿Consultar temprano etiqueta al niño?', 'No. Evaluar una preocupación busca comprender necesidades y facilitar apoyo oportuno; no implica asumir un diagnóstico.']
    ]
  },
  {
    slug: 'teleconsulta-pediatrica.html',
    name: 'Teleconsulta Pediátrica',
    title: 'Teleconsulta Pediátrica | Consulta Online en Español',
    description: 'Teleconsulta pediátrica en español para seguimiento, orientación, lactancia, alimentación, sueño, desarrollo y segunda opinión, desde Colombia o el exterior.',
    eyebrow: 'Orientación pediátrica sin importar la distancia',
    lead: 'Una consulta por videollamada para revisar información, observar lo que sea posible a distancia y definir con claridad qué puede resolverse virtualmente y qué necesita atención presencial.',
    intro: 'La teleconsulta es una modalidad clínica, no solo una llamada. Requiere identificar al paciente, comprender el motivo, revisar antecedentes, proteger la privacidad y reconocer los límites del examen a distancia.',
    suitable: ['Seguimiento de una evolución conocida', 'Revisión de exámenes o indicaciones previas', 'Lactancia, alimentación, sueño y desarrollo', 'Preparación para recién nacido', 'Dudas no urgentes y segunda opinión', 'Orientación en español para familias en el exterior'],
    covers: ['Motivo, antecedentes y evolución', 'Observación por cámara cuando aporta información', 'Registros, imágenes o documentos disponibles', 'Preguntas y prioridades de la familia', 'Opciones y señales que deben vigilarse', 'Necesidad de examen presencial, pruebas o urgencias'],
    prepare: ['Busca un lugar privado, iluminado y con conexión estable.', 'Ten al niño presente cuando sea posible y seguro.', 'Prepara exámenes, medicamentos, peso y talla si los tienes.', 'Envía antes los documentos solo por el canal acordado.'],
    limits: 'No permite auscultar, palpar, medir signos vitales de forma confiable ni realizar procedimientos. La prescripción y los documentos dependen de la valoración y de las normas aplicables.',
    source_url: 'https://www.who.int/publications/i/item/9789240038073',
    source_name: 'Teleconsultas con niños y familias · OMS',
    faqs: [
      ['¿Qué necesito para conectarme?', 'Un teléfono o computador con cámara, conexión estable, buena iluminación y un espacio donde puedas hablar con privacidad.'],
      ['¿Mi hijo debe estar presente?', 'Generalmente sí, cuando sea posible y seguro. En algunas consultas de preparación o conversación inicial puede acordarse otra dinámica.'],
      ['¿Se pueden formular medicamentos?', 'Depende de la valoración clínica, la información disponible y las normas aplicables. No toda consulta virtual termina en una prescripción.'],
      ['¿Cómo sé si necesito consulta presencial?', 'Durante la valoración se explican los límites encontrados. Si hay señales de alarma o se requiere examen físico, se recomendará atención presencial.']
    ]
  },
  {
    slug: 'consulta-urgencias-pediatricas.html',
    name: 'Orientación Pediátrica Urgente',
    title: 'Orientación Pediátrica Urgente | Cuándo ir a Urgencias',
    description: 'Orientación para reconocer cuándo un niño necesita pediatra, atención prioritaria o urgencias. No sustituye emergencias ni atención presencial inmediata.',
    eyebrow: 'Elegir atención sin retrasar una emergencia',
    lead: 'Orientación para familias que necesitan decidir el siguiente paso ante un síntoma, siempre que el niño esté estable y no presente señales de peligro inmediato.',
    intro: 'No todo síntoma requiere una sala de emergencias, pero algunas situaciones no permiten esperar. Esta consulta ayuda a ordenar información y reconocer el nivel de atención; no es un servicio de emergencias ni garantiza que el caso pueda manejarse a distancia.',
    alert: 'Si el niño tiene dificultad para respirar, labios o piel azulados, convulsiones, pérdida de conciencia, sangrado que no se detiene, lesión grave, dolor intenso, intoxicación, deshidratación marcada o deterioro rápido, acude ahora al servicio de emergencias local.',
    suitable: ['Dudas sobre fiebre en un niño que se mantiene estable', 'Síntomas leves sin señales de alarma', 'Cambios recientes que necesitan orientación', 'Decidir entre cita programada y atención prioritaria', 'Revisar qué información llevar al servicio presencial'],
    covers: ['Edad y antecedentes del niño', 'Inicio y evolución del síntoma', 'Estado general, respiración e hidratación', 'Dolor, fiebre y síntomas asociados', 'Tratamientos ya utilizados', 'Señales para escalar inmediatamente la atención'],
    prepare: ['Observa respiración, color y nivel de alerta.', 'Ten temperatura y medicamentos administrados si los conoces.', 'Anota ingesta de líquidos y orina reciente.', 'No retrases emergencias por reunir información o esperar respuesta.'],
    limits: 'La orientación remota no puede estabilizar una emergencia, realizar examen físico ni sustituir ambulancia, urgencias o atención prioritaria. Ante duda razonable de peligro, elige atención presencial.',
    source_url: 'https://www.healthychildren.org/English/health-issues/injuries-emergencies/Pages/When-to-Call-Emergency-Medical-Services-EMS.aspx',
    source_name: 'Cuándo solicitar atención de emergencia · American Academy of Pediatrics',
    faqs: [
      ['¿Esta página ofrece un servicio de emergencias?', 'No. No reemplaza ambulancia, urgencias ni atención presencial inmediata.'],
      ['¿Debo esperar respuesta si mi hijo respira con dificultad?', 'No. La dificultad respiratoria es una señal para buscar atención presencial inmediata o activar el sistema de emergencias local.'],
      ['¿Puede orientarme si el niño está estable?', 'Sí, una consulta puede ayudar a organizar síntomas y decidir el nivel de atención, siempre que no existan señales de alarma.'],
      ['¿Qué hago ante una intoxicación?', 'Contacta inmediatamente el servicio de emergencias o toxicología disponible en tu ubicación y conserva el envase o la información de la sustancia.']
    ]
  }
].freeze

def esc(value)
  CGI.escapeHTML(value.to_s)
end

def list(items)
  items.map { |item| %(<li class="flex gap-3"><span class="mt-1 text-teal">✓</span><span>#{esc(item)}</span></li>) }.join("\n")
end

def page(service)
  canonical = "#{BASE}/#{service[:slug]}"
  faq_schema = {
    '@context' => 'https://schema.org', '@type' => 'FAQPage',
    'mainEntity' => service[:faqs].map { |q, a| {'@type'=>'Question','name'=>q,'acceptedAnswer'=>{'@type'=>'Answer','text'=>a}} }
  }
  service_schema = {
    '@context'=>'https://schema.org','@type'=>'Service','@id'=>"#{canonical}#service",'name'=>service[:name],
    'serviceType'=>service[:name],
    'url'=>canonical,'description'=>service[:description],'medicalSpecialty'=>'Pediatrics',
    'provider'=>{'@type'=>'Physician','name'=>'Dra. Jazmín Prada','telephone'=>'+573187022574','sameAs'=>['https://www.instagram.com/drajazminpradapediatra']},
    'areaServed'=>[{'@type'=>'Country','name'=>'Colombia'},{'@type'=>'Place','name'=>'Familias hispanohablantes en el exterior'}],
    'availableChannel'=>{'@type'=>'ServiceChannel','serviceUrl'=>canonical,'servicePhone'=>'+573187022574'}
  }
  breadcrumb_schema = {'@context'=>'https://schema.org','@type'=>'BreadcrumbList','itemListElement'=>[
    {'@type'=>'ListItem','position'=>1,'name'=>'Pediatra Colombia','item'=>"#{BASE}/"},
    {'@type'=>'ListItem','position'=>2,'name'=>'Servicios pediátricos','item'=>"#{BASE}/#servicios"},
    {'@type'=>'ListItem','position'=>3,'name'=>service[:name],'item'=>canonical}
  ]}
  webpage_schema = {'@context'=>'https://schema.org','@type'=>'WebPage','@id'=>"#{canonical}#webpage",'url'=>canonical,
    'name'=>service[:title],'description'=>service[:description],'inLanguage'=>'es','dateModified'=>UPDATED,
    'primaryImageOfPage'=>{'@type'=>'ImageObject','url'=>"#{BASE}/og-image.jpg",'width'=>1200,'height'=>630},
    'mainEntity'=>{'@id'=>"#{canonical}#service"}}
  wa_text = CGI.escape("Hola Dra. Jazmín, quiero información sobre #{service[:name]}").gsub('+', '%20')
  alert = service[:alert] ? <<~HTML : ''
    <div class="mt-8 rounded-2xl border-2 border-coral bg-coral/10 p-5 text-left" role="alert">
      <p class="font-bold text-navy mb-1">Atención inmediata</p>
      <p class="text-sm leading-relaxed text-slate-text">#{esc(service[:alert])}</p>
    </div>
  HTML
  faq_html = service[:faqs].map.with_index do |(q, a), index|
    <<~HTML
      <div class="faq-item rounded-xl border border-gray-200 bg-white overflow-hidden">
        <button type="button" class="w-full flex items-center justify-between gap-4 p-5 text-left font-semibold text-navy" aria-expanded="false" aria-controls="faq-#{index}" onclick="toggleFaq(this)">
          <span>#{esc(q)}</span><span aria-hidden="true" class="text-teal text-xl">+</span>
        </button>
        <div id="faq-#{index}" class="faq-answer hidden px-5 pb-5 text-sm leading-relaxed text-slate-text">#{esc(a)}</div>
      </div>
    HTML
  end.join

  <<~HTML
    <!doctype html>
    <html lang="es">
    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <meta name="robots" content="index, follow, max-image-preview:large, max-snippet:-1">
      <meta name="author" content="Dra. Jazmín Prada">
      <title>#{esc(service[:title])}</title>
      <meta name="description" content="#{esc(service[:description])}">
      <link rel="canonical" href="#{canonical}">
      <link rel="icon" type="image/png" href="assets/img/logo.png">
      <meta property="og:locale" content="es_CO">
      <meta property="og:type" content="website">
      <meta property="og:title" content="#{esc(service[:title])}">
      <meta property="og:description" content="#{esc(service[:description])}">
      <meta property="og:url" content="#{canonical}">
      <meta property="og:image" content="#{BASE}/og-image.jpg">
      <meta property="og:image:width" content="1200"><meta property="og:image:height" content="630">
      <meta name="twitter:card" content="summary_large_image">
      <meta name="twitter:title" content="#{esc(service[:title])}">
      <meta name="twitter:description" content="#{esc(service[:description])}">
      <meta name="twitter:image" content="#{BASE}/og-image.jpg">
      <script async src="https://www.googletagmanager.com/gtag/js?id=G-NJD0RZJ6J6"></script>
      <script>window.dataLayer=window.dataLayer||[];function gtag(){dataLayer.push(arguments)}gtag('js',new Date());gtag('config','G-NJD0RZJ6J6');</script>
      <script src="https://cdn.tailwindcss.com/3.4.17"></script>
      <link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
      <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700&amp;family=Playfair+Display:wght@600;700&amp;display=swap" rel="stylesheet">
      <script>tailwind.config={theme:{extend:{colors:{teal:{DEFAULT:'#2A9D8F',light:'#E6F5F3'},navy:'#264653',coral:'#E76F51',offwhite:'#F8F9FA'},fontFamily:{sans:['DM Sans','sans-serif'],heading:['Playfair Display','serif']}}}}</script>
      <script type="application/ld+json">#{JSON.generate(service_schema)}</script>
      <script type="application/ld+json">#{JSON.generate(faq_schema)}</script>
      <script type="application/ld+json">#{JSON.generate(breadcrumb_schema)}</script>
      <script type="application/ld+json">#{JSON.generate(webpage_schema)}</script>
    </head>
    <body class="bg-offwhite text-navy font-sans antialiased">
      <header class="sticky top-0 z-40 border-b border-gray-100 bg-white/95 backdrop-blur">
        <nav class="max-w-6xl mx-auto px-4 py-3 flex items-center justify-between" aria-label="Navegación principal">
          <a href="/" aria-label="Pediatra Colombia"><img src="assets/img/logo.png" width="150" height="43" alt="Dra. Jazmín Prada, Pediatra Colombia"></a>
          <div class="flex items-center gap-4 text-sm font-semibold"><a href="/#servicios" class="hidden sm:inline hover:text-teal">Servicios</a><a href="/#sobre-mi" class="hidden sm:inline hover:text-teal">Sobre la doctora</a><a href="https://wa.me/#{PHONE}?text=#{wa_text}" target="_blank" rel="noopener noreferrer" class="rounded-full bg-coral px-5 py-2.5 text-white">Agendar</a></div>
        </nav>
      </header>
      <main>
        <section class="bg-gradient-to-br from-teal-light via-white to-offwhite px-4 py-16 md:py-24">
          <div class="max-w-5xl mx-auto text-center">
            <p class="text-sm font-bold uppercase tracking-widest text-teal">#{esc(service[:eyebrow])}</p>
            <h1 class="font-heading text-4xl md:text-6xl font-bold mt-4 mb-6">#{esc(service[:name])}</h1>
            <p class="mx-auto max-w-3xl text-lg md:text-xl leading-relaxed text-slate-600">#{esc(service[:lead])}</p>
            #{alert}
            <div class="mt-8 flex flex-wrap justify-center gap-3"><a href="https://wa.me/#{PHONE}?text=#{wa_text}" target="_blank" rel="noopener noreferrer" class="rounded-full bg-coral px-7 py-3.5 font-bold text-white shadow-lg">Consultar por WhatsApp</a><a href="#como-funciona" class="rounded-full border border-teal/30 bg-white px-7 py-3.5 font-bold text-teal">Conocer el servicio</a></div>
          </div>
        </section>
        <section id="como-funciona" class="px-4 py-16 md:py-20 bg-white"><div class="max-w-4xl mx-auto"><p class="text-lg leading-8 text-slate-600">#{esc(service[:intro])}</p></div></section>
        <section class="px-4 py-16 md:py-20"><div class="max-w-6xl mx-auto grid lg:grid-cols-2 gap-8">
          <article class="rounded-3xl bg-white p-7 md:p-9 border border-gray-100"><p class="text-sm font-bold uppercase tracking-wider text-teal">Cuándo puede ser útil</p><h2 class="font-heading text-3xl font-bold mt-2 mb-6">Motivos frecuentes de consulta</h2><ul class="space-y-3 text-slate-600">#{list(service[:suitable])}</ul></article>
          <article class="rounded-3xl bg-white p-7 md:p-9 border border-gray-100"><p class="text-sm font-bold uppercase tracking-wider text-teal">Evaluación individual</p><h2 class="font-heading text-3xl font-bold mt-2 mb-6">Qué se revisa</h2><ul class="space-y-3 text-slate-600">#{list(service[:covers])}</ul></article>
        </div></section>
        <section class="px-4 py-16 md:py-20 bg-teal-light"><div class="max-w-6xl mx-auto grid lg:grid-cols-5 gap-10 items-start">
          <div class="lg:col-span-2"><p class="text-sm font-bold uppercase tracking-wider text-teal">Antes de la cita</p><h2 class="font-heading text-3xl md:text-4xl font-bold mt-2 mb-4">Cómo prepararte</h2><p class="text-slate-600 leading-relaxed">No necesitas tener todos los datos. Reunir la información disponible permite dedicar más tiempo a las preguntas y decisiones importantes.</p></div>
          <ol class="lg:col-span-3 grid sm:grid-cols-2 gap-4">#{service[:prepare].map.with_index{|item,i|%(<li class="rounded-2xl bg-white p-5 text-sm leading-relaxed text-slate-600"><span class="block text-teal font-bold mb-2">#{i+1}</span>#{esc(item)}</li>)}.join}</ol>
        </div></section>
        <section class="px-4 py-16 md:py-20 bg-white"><div class="max-w-4xl mx-auto"><p class="text-sm font-bold uppercase tracking-wider text-coral">Alcance y seguridad</p><h2 class="font-heading text-3xl md:text-4xl font-bold mt-2 mb-4">Lo que esta consulta no reemplaza</h2><p class="text-lg leading-8 text-slate-600">#{esc(service[:limits])}</p></div></section>
        <section class="px-4 py-16 md:py-20"><div class="max-w-4xl mx-auto"><p class="text-sm font-bold uppercase tracking-wider text-teal">Respuestas claras</p><h2 class="font-heading text-3xl md:text-4xl font-bold mt-2 mb-8">Preguntas frecuentes</h2><div class="space-y-3">#{faq_html}</div></div></section>
        <section class="px-4 pb-16"><div class="max-w-4xl mx-auto rounded-2xl border border-teal/20 bg-white p-6"><p class="font-bold mb-2">Fuente para ampliar</p><a href="#{esc(service[:source_url])}" target="_blank" rel="noopener noreferrer" class="text-teal underline">#{esc(service[:source_name])}</a><p class="mt-4 text-xs text-slate-500">Contenido informativo actualizado el <time datetime="#{UPDATED}">12 de julio de 2026</time>. No sustituye una valoración médica individual.</p></div></section>
        <section class="px-4 py-16 bg-navy text-white"><div class="max-w-3xl mx-auto text-center"><h2 class="font-heading text-3xl md:text-4xl font-bold mb-4">¿Quieres saber si este servicio es adecuado?</h2><p class="text-white/75 mb-7">Escribe por WhatsApp para explicar brevemente el motivo y coordinar la modalidad.</p><a href="https://wa.me/#{PHONE}?text=#{wa_text}" target="_blank" rel="noopener noreferrer" class="inline-block rounded-full bg-coral px-8 py-4 font-bold">Consultar disponibilidad</a></div></section>
      </main>
      <footer class="bg-navy border-t border-white/10 px-4 py-10 text-white/70"><div class="max-w-6xl mx-auto flex flex-col md:flex-row gap-4 justify-between text-sm"><div><p class="font-heading text-white font-bold text-lg">Pediatra Colombia</p><p>Dra. Jazmín Prada · Médica Pediatra · Universidad de Buenos Aires</p></div><div class="md:text-right"><a href="/" class="hover:text-white">Inicio</a> · <a href="/#servicios" class="hover:text-white">Servicios</a><p class="mt-2 text-xs">La información educativa no reemplaza urgencias ni valoración presencial.</p></div></div></footer>
      <script>
        function track(name,params){if(typeof window.gtag==='function')window.gtag('event',name,params||{})}
        function toggleFaq(button){var answer=button.nextElementSibling;var opening=answer.classList.contains('hidden');document.querySelectorAll('.faq-answer').forEach(function(item){item.classList.add('hidden')});document.querySelectorAll('.faq-item button').forEach(function(item){item.setAttribute('aria-expanded','false')});if(opening){answer.classList.remove('hidden');button.setAttribute('aria-expanded','true');track('faq_open',{faq_question:button.textContent.trim(),page_path:location.pathname})}}
        document.addEventListener('click',function(event){var link=event.target.closest('a[href*="wa.me/"]');if(link)track('generate_lead',{method:'WhatsApp',link_url:link.href,page_path:location.pathname})});
      </script>
    </body>
    </html>
  HTML
end

SERVICES.each { |service| File.binwrite(service[:slug], page(service)) }
