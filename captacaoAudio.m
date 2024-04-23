clear; clc;
% Configurações
tempoTotal = 6; % Tempo total de gravação em segundos
duracaoJanela = 3; % Duração de cada janela de gravação em segundos
limiarFreqGrave = 100; % Limiar de frequência grave (em Hz)

% Inicialização
fs = 44100; % Taxa de amostragem
dados = cell(2, 1);

% Inicializa a figura e os subplots
figure;
subplot(2, 1, 1);
hLine{1} = animatedline('Color', 'b', 'LineWidth', 1);
xlabel('Tempo (s)');
ylabel('Amplitude');
title('Captação de áudio em tempo real - Janela 1');

subplot(2, 1, 2);
hLine{2} = animatedline('Color', 'r', 'LineWidth', 1);
xlabel('Tempo (s)');
ylabel('Amplitude');
title('Captação de áudio em tempo real - Janela 2');

% Loop de captação em tempo real para cada janela
for janela = 1:2
    % Gravação de áudio
    recorder = audiorecorder(fs, 16, 1); % Configuração do gravador
    disp(['Iniciando gravação - Janela ', num2str(janela)]);
    recordblocking(recorder, duracaoJanela); % Gravação de áudio bloqueante
    disp(['Gravação concluída - Janela ', num2str(janela)]);
    
    % Obtém os dados de áudio em tempo real e plota
    audioData = getaudiodata(recorder);
    t = (1:length(audioData)) / fs; % Vetor de tempo
    for i = 1:length(t)
        addpoints(hLine{janela}, t(i), audioData(i));
        drawnow limitrate;
    end
    
    % Armazena os dados
    dados{janela} = audioData;
end

% Comparação entre as duas gravações
frequenciaFundamental1 = pitch(dados{1}, fs);
frequenciaFundamental2 = pitch(dados{2}, fs);

tomMaisGrave1 = frequenciaFundamental1(1); % Tom mais grave da primeira gravação
tomMaisGrave2 = frequenciaFundamental2(1); % Tom mais grave da segunda gravação

% Exibição do resultado da comparação
if tomMaisGrave1 > tomMaisGrave2
    disp('A gravação da janela 1 é mais grave do que a gravação da janela 2.');
elseif tomMaisGrave1 < tomMaisGrave2
    disp('A gravação da janela 2 é mais grave do que a gravação da janela 1.');
else
    disp('As gravações têm a mesma frequência fundamental mais grave.');
end

% Gerar nome de arquivo baseado na data e hora atual
dataHoraAtual = datestr(now, 'yyyymmdd_HHMMSS');
nomeArquivo = ['dados_audio_', dataHoraAtual, '.xlsx'];

% Salva os dados em uma planilha do Excel
xlswrite(nomeArquivo, dados, 'Sheet1');

disp(['Gravação concluída e dados salvos com sucesso em ', nomeArquivo]);
