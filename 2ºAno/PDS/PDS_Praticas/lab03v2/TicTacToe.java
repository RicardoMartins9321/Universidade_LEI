public class TicTacToe implements JGaloInterface {
    private char[][] board = new char[3][3];
    private char currentPlayer = 'X';
    private boolean gameFinished = false;
    private int number = 0;
    private static final int numberMax = 9; 

    public TicTacToe() {
        // Inicializa o tabuleiro com espaços vazios
        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 3; j++) {
                board[i][j] = ' ';
            }
        }
    }

    @Override
    public char getActualPlayer() {
        return currentPlayer;
    }

    @Override
    public boolean setJogada(int lin, int col) {
        if (lin < 1 || lin > 3 || col < 1 || col > 3 || board[lin - 1][col - 1] != ' ') {
            return false;
        }
        board[lin - 1][col - 1] = currentPlayer;
        number++;
        checkGameFinished();
        currentPlayer = (currentPlayer == 'X') ? 'O' : 'X';
        return true;
    }

    @Override
    public boolean isFinished() {
        return gameFinished || checkGameFinished();
    }

    @Override
    public char checkResult() {
        if (checkGameFinished()) {
            return currentPlayer == 'X' ? 'O' : 'X';
        }
        return ' ';
    }

    private boolean checkGameFinished() {
        // Verifica linhas, colunas e diagonais
        for (int i = 0; i < 3; i++) {
            if (board[i][0] != ' ' && board[i][0] == board[i][1] && board[i][1] == board[i][2]) {
                gameFinished = true;
                return true;
            }
            if (board[0][i] != ' ' && board[0][i] == board[1][i] && board[1][i] == board[2][i]) {
                gameFinished = true;
                return true;
            }
        }
        if (board[0][0] != ' ' && board[0][0] == board[1][1] && board[1][1] == board[2][2]) {
            gameFinished = true;
            return true;
        }
        if (board[0][2] != ' ' && board[0][2] == board[1][1] && board[1][1] == board[2][0]) {
            gameFinished = true;
            return true;
        }
        // Verifica se o tabuleiro está cheio
        if(number>=numberMax){
            gameFinished = true;
            return false;
        }

        return false;
    }
}
