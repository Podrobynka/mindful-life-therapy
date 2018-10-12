# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Setting.first_or_create({
  telephone: '07933446549',
  contact_email: 'info@mindfullifetherapy.co.uk',
  office_address_line_1: '10 Newton Place',
  office_address_line_2: '',
  office_address_line_3: '',
  office_address_city: 'Glasgow',
  office_address_postcode: 'G3 7PR',
  session_rate: '£55 per 50 minute session'
})

AboutPage.first_or_create({
  body: %Q(<div>Mindful Life Therapy offers individual counselling and psychotherapy in Glasgow and further afield.</div><div><br>Services are provided by <strong>Zoe Zalavary</strong> BA (Hons), PGDip, MBACP, a BACP registered Counsellor and Psychotherapist, and qualified Mindfulness teacher (trained through Bangor University and the Mindfulness Association).<br><br>Zoe's therapeutic work integrates Person-centred, Compassion Focused Therapy and Mindfulness and helps address a wide range of issues including:<br><br></div><blockquote>Abuse, Addictions, Anxiety, Bereavement, Depression, Eating Disorders, Identity Problems, Loss, Personal Development, Relationships, Self Esteem, Spirituality, Stress and Work related issues.</blockquote><div><br></div><div>Working with <strong>depression,</strong> <strong>anxiety</strong> and <strong>shame based issues</strong> as well as <strong>identity, spirituality</strong> and <strong>existential issues</strong> are areas of speciality.&nbsp;<br><br></div><h2>About Zoe Zalavary</h2><div><br></div><div>Zoe is an experienced meditator who has practised Buddhist meditation for over seventeen years. In 2000, she left her job at the BBC in Leeds (after initially training in Broadcast Journalism) and moved into a residential Buddhist college in Yorkshire, to train in Buddhist philosophy, psychology and meditation.</div><div><br>The initial sabbatical she planned ended up becoming ten years of living in community, nine of which she was ordained as a Buddhist nun. During this time she taught many meditation classes and courses.<br><br></div><div>In 2009, Zoe accomplished a long held dream of completing a three year solitary meditation retreat in the forest of Ae in Dumfriesshire. Her time in retreat was deeply transformational; she experienced some of the highest highs and lowest lows, increasing her insight and self awareness.<br><br></div><div>After finishing her retreat she was drawn to the city to bring her experience of working with the mind to benefit people in the heart of the community. Intending to bring her experience of Buddhist Psychology and meditation into a Western secular context, she has since been further developing her skills by training in Person-Centred Therapy (at the University of Strathclyde) and Compassion Focused Therapy with Prof Paul Gilbert and Dr Chris Irons.<br><br></div><div>Although Zoe had already practised Mindfulness for many years through her Buddhist training, she decided to train as a secular Mindfulness teacher with Bangor University so she would be able to offer Mindfulness Based Stress Reduction and Mindfulness Based Cognitive Therapy (Bangor is one of only three higher educational establishments in the UK that offer teacher training in MBSR and MBCT).<br><br></div><div>Zoe also trained in Compassion Based Mindfulness approaches through the Mindfulness Association, with Prof Paul Gilbert and Choden in their model of Mindful Compassion and with Dr Chris Germer and Dr Kristin Neff in their model of Mindful Self Compassion.</div>)
})

CounsellingPage.first_or_create({
  body: %Q(<div>I offer a comfortable and confidential space for you to talk and be heard; a genuine human encounter that is warm, empathic and non judgemental.<br><br></div><div>I believe the quality of relationship between therapist and client is important in facilitating growth and healing and I hope to put you at ease so that you feel safe and held in this process.<br><br></div><h2>Person-centred Approach</h2><div><br>Also key to my approach is the understanding that as individuals we need different things at different times and that a person-centred approach is essential, so we will work organically and at your pace; my role being to tune into what you bring and offer you tailored support weaving together my experience of Person Centred Therapy, Compassion Focused Therapy and Mindfulness.<br><br></div><h2>Location</h2><div><br>My practice is based at peaceful and comfortable premises in the Charing Cross area of Glasgow.<br><br>The address is: 10 Newton Place, Glasgow, G3 7PR.<br><br></div><h2>Online Counselling &amp; International Clients</h2><div><br>I counsel several international clients via video chat (skype, facetime, zoom etc), and would love to work with you wherever you are based.<br><br></div><h2>Appointments</h2><div><br>Sessions usually take place once a week and last 50 minutes. Making a regular commitment gives you a better chance of finding out why you are having difficulties and working out what you want to do about them.<br><br>Our initial appointment will be an opportunity to explore issues and assess what is needed. This can be done in person or over the phone. There is no obligation to commit at this point but if it feels good to pursue a working relationship we would usually start by contracting for six sessions. This is a standard starting point and may be extended if longer term therapy is needed.<br><br></div><h2>Payments</h2><div><br>Payment can be made in cash or bank transfer. If you are being funded by an organisation, the necessary arrangements for payment of fees should be made in advance.<br><br>The rate for individual counselling is £55 per 50 minute session. This should be paid at the end of each session.<br><br></div><h2>Cancellations &amp; Missed Appointments</h2><div><br>As with most professional services whose practitioners are self-employed and need to manage their diaries efficiently, we operate a strict cancellation and missed session policy. Clients are required to give a minimum of two business days (48 hours) notice of any cancelled session. The full fee is due if adequate notice is not given.</div>)
})

MindfulnessPage.first_or_create({
  body: %Q(<div>Mindfulness is all about how we pay attention. Normally our attention is random and is pulled here and there by our habits.<br><br>Most of the time this is not helpful because we tend to dwell on negatives: re-living past issues or worrying about things in the future. So much of the time we live in the past or future, but life happens now.<br><br>Mindfulness training is intentionally to bring our minds to what is happening in the present, while at the same time not judging our thoughts and feelings.<br><br>We train to be fully present with whatever we are doing while we are doing it. This can make our lives much simpler, happier and more effective.<br><br></div><h2>Why practise mindfulness?</h2><div><br>Most of the time our attention is divided: for example, we eat our lunch and think about the afternoon ahead or we drive our car and dwell on what happened in the morning.<br><br>Our minds are either dwelling in the past or anticipating the future. This is stressful because it fragments our attention and dissipates our energy. We are pulled in different directions causing mental agitation, tension and anxiety.<br><br>The practise of mindfulness is to focus all of our attention on one thing and to do it properly - when we eat lunch, we just eat lunch. Life is happening in the present moment.<br><br>If we are not in the present moment we are living in a world of thoughts – mostly negative thoughts. We often live our lives on autopilot, carrying out routine activities while our minds are jumping around in the past or future like a monkey jumping from tree to tree. This robs us of the precious experiences of life: we do not connect with the people we love. We see them fleetingly and then drift into the thoughts and issues that are preoccupying us. We eat without really tasting, hear without listening and see without really seeing.<br><br>We live in a state of unawareness and often miss what is most meaningful in our lives.<br><br></div><h2>What are the benefits of mindfulness?</h2><div><br>Research has shown that mindfulness has wide ranging benefits such as the management of stress, anxiety, pain, chronic illness, hypertension, heart disease, cancer and prevention of depressive relapse.<br><br>Those who integrate mindfulness into their lives report benefits, such as less stress, greater ease, being more at ease with oneself and others, and working more creatively with challenges. Mindfulness has also been shown to increase brain size.<br><br>If we maintain a regular practise of mindfulness, the cascading thoughts and emotions start to settle. We start to experience more space and clarity in our minds. In the beginning it is like we walk into a darkened room, which is the unaware mind. As mindfulness strengthens the room starts to light up, almost as if someone is turning up the dimmer switch. We start to see the furniture in the room. We start to see what is going on in our minds, what patterns are driving us and what pain we are suppressing.<br><br>We begin to see that there is a space between ourselves and our thoughts and that most of the time we latch onto and run with whatever thoughts pop up in our mind. We don’t notice this space. Mindfulness practise is about recognising and developing this space.<br><br>We then realise that we have a choice as to what thoughts we think. We don’t have to dwell on negative thoughts. We can instead cultivate positive ones. A lot of the time we dwell on negative thoughts and feed our life energy into them.<br><br>We then begin to see that the mind is very powerful and it creates our entire experience. If we cultivate wholesome thoughts and feelings we attract wholesome experiences into our life. If we dwell on negative thoughts and feelings, we attract negative experiences.<br><br>As our practise deepens further, we realise that none of what is going on in our minds is solid and real. We make it solid and real. We notice how the mind grasps onto experiences, makes them solid and calls them 'me'.<br><br>The more we practise mindfulness the more well-being, peacefulness and clarity begins to emerge in our mind. We realise that there is no problem and nothing is wrong. We have just been in the grip of a fever that we have taken to be real. This fever is our habitual way of thinking and judging and reacting. And if we feed it, it continues endlessly.<br><br>To use a simple analogy, it is like the clouds obscuring the sun. The clouds represent all our worries, busy thoughts and ups and downs. The sun represents our inner well being and peacefulness which is always there behind the clouds. Through practising mindfulness the clouds start to break and disperse and the sun begins to shine through more and more.<br><br></div><h2>Introduction to Mindfulness Workshop</h2><div><br>This one day workshop will introduce you to the key principles of mindfulness and introduce some simple practises to help you cultivate mindfulness in daily life. The day will include guided mindfulness meditation, gentle movement practises, mindfulness talks and discussion.<br><br>Mindfulness is a practical technique that is easy to learn. People who are more mindful are much more able to deal with the stress of modern living. Mindfulness helps us become more productive and able to find creative solutions in our lives and builds resilience and well-being.<br><br>No previous experience is necessary and the day is fully guided. The workshop is for people who are curious about mindfulness and may be considering further training such as an Eight Week Mindfulness Based Stress Reduction Course.<br><br></div><h2>Mindful Compassion Workshop</h2><div><br>This one day workshop will introduce the key principles and practise of Mindful Compassion; a synthesis of Western therapeutic and Buddhist approaches outlined in <a href="https://www.newharbinger.com/mindful-compassion">Mindful Compassion</a> (2013) by Paul Gilbert and Choden.<br><br>We learn a step by step approach to developing the inner compassionate self by first building the foundation of mindfulness, learning to work with difficulty and cultivating a warm and receptive inner environment from which to respond to ourself and others. In doing this we will experience the healing and transformative quality compassion brings to both our inner and outer environment.<br><br>The day will include guided meditation, gentle movement practises, talks and discussion. The workshop is open to those who have some previous experience of mindfulness.<br><br></div><h2>Eight Week Mindfulness Based Stress Reduction Course</h2><div><br>The eight week Mindfulness Based Stress Reduction (MBSR) course is the world famous programme of Mindfulness training developed by Jon Kabat Zinn at the University of Massachusetts Medical Centre in 1979. MBSR aims to help you take better care of yourself and get the most out of life. The aim of the programme is to learn new ways of dealing with challenging physical sensations, feelings, moods or social interactions.<br><br></div><ul><li>an increased ability to relax</li><li>greater energy and enthusiasm for life</li><li>heightened self-confidence</li><li>an increased ability to cope more effectively with stressful situations</li></ul><div><br></div><h2>What does the course involve?</h2><div><br></div><div>The MBSR programme is run over eight weeks in two-hour evening sessions. A whole day of Mindfulness practise in the form of a retreat is included after week six. If you are unable to attend the retreat or the occasional evening you will have the opportunity to make this up on a future course. To get the most out of coming to the class requires some commitment and each participant is required to undertake home practise in between classes.<br><br><strong>Who is the course for?</strong><br><br>Everyone! The programme is known to benefit people with a range of problems of both a physical and a psychological nature, but we all have times in our lives when we experience difficulty, stress and struggle. Developing greater awareness can help us change how we approach our experiences, take more pleasure in the good things and deal more effectively with difficulties.<br><br><strong>Mindfulness Practice Retreat<br></strong><br>A silent practise day is open to those who have already completed an 8 week Mindfulness Course. Regular retreat is recommended as a helpful way of renewing and deepening our Mindfulness practise.<br><br>We will spend much of the day in silence, and you will be led in meditations and other practises from the 8 Week Mindfulness Based Stress Reduction Course.<br><br>This is an opportunity to deepen your mindfulness practise, with the support of a group of others working in the same way. It is also a time to experience the benefit of dropping into silence.<br><br>We encourage you to see the day as a time to be with yourself in a nurturing way. There will be an opportunity to ask questions and check things out as we start and at the end to reflect on your experiences.<br><br></div><h2>One-to-One Mindfulness Training</h2><div><br>There are different reasons why you might choose one to one Mindfulness training.<br>Perhaps you have something specific you want to work on and require more personal attention than a group situation can offer.<br><br>Or maybe you are shy or going through something challenging and feel more comfortable working individually.<br><br>When we work one to one our sessions can be specifically tailored to your needs using a variety of Mindfulness Based approaches. We may explore Mindful Compassion and Mindful Self Compassion practises as well as the more traditional Mindfulness Based Stress Reduction and Mindfulness Association curriculum.</div>)
})
