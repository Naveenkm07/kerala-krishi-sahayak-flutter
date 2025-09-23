import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_state_provider.dart';

class VoiceScreen extends StatefulWidget {
  const VoiceScreen({super.key});

  @override
  State<VoiceScreen> createState() => _VoiceScreenState();
}

class _VoiceScreenState extends State<VoiceScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _isVoiceActive = false;
  bool _isTyping = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeChatHistory();
    });
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _initializeChatHistory() {
    final appState = Provider.of<AppStateProvider>(context, listen: false);
    if (appState.chatHistory.isEmpty) {
      final userName = appState.currentUser?.name.split('(')[0].trim() ?? 'Farmer';
      appState.addChatMessage(
        'Hello $userName! I\'m your farming assistant. Ask me anything about crops, weather, or farming practices.\n\nനമസ്കാരം! ഞാൻ നിങ്ങളുടെ കാർഷിക സഹായിയാണ്. വിളകൾ, കാലാവസ്ഥ, അല്ലെങ്കിൽ കാർഷിക രീതികൾ എന്നിവയെക്കുറിച്ച് എന്തും ചോദിക്കൂ.',
        'bot'
      );
    }
  }

  void _sendMessage() {
    final message = _messageController.text.trim();
    if (message.isEmpty) return;

    final appState = Provider.of<AppStateProvider>(context, listen: false);
    
    // Add user message
    appState.addChatMessage(message, 'user');
    _messageController.clear();
    
    // Show typing indicator
    setState(() {
      _isTyping = true;
    });
    
    // Scroll to bottom
    _scrollToBottom();
    
    // Get real AI response
    appState.getAIResponse(message).then((response) {
      if (mounted) {
        setState(() {
          _isTyping = false;
        });
        
        appState.addChatMessage(response, 'bot');
        _scrollToBottom();
      }
    }).catchError((error) {
      if (mounted) {
        setState(() {
          _isTyping = false;
        });
        
        appState.addChatMessage('Sorry, I am having trouble connecting. Please try again.', 'bot');
        _scrollToBottom();
      }
    });
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _askPredefinedQuestion(String question) {
    _messageController.text = question;
    _sendMessage();
  }

  void _toggleVoiceInput() {
    setState(() {
      _isVoiceActive = !_isVoiceActive;
    });
    
    if (_isVoiceActive) {
      // Simulate voice recording
      Future.delayed(const Duration(seconds: 3), () {
        if (mounted && _isVoiceActive) {
          setState(() {
            _isVoiceActive = false;
          });
          _messageController.text = "How to protect paddy from brown plant hopper?";
        }
      });
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Voice recording simulation... (3 seconds)'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateProvider>(
      builder: (context, appState, child) {
        return Column(
          children: [
            // Chat History
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        controller: _scrollController,
                        padding: const EdgeInsets.all(16),
                        itemCount: appState.chatHistory.length + (_isTyping ? 1 : 0),
                        itemBuilder: (context, index) {
                          if (_isTyping && index == appState.chatHistory.length) {
                            return _buildTypingIndicator();
                          }
                          
                          final chat = appState.chatHistory[index];
                          return _buildChatMessage(
                            chat['message']!,
                            chat['sender']!,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Input Area
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                border: Border(
                  top: BorderSide(
                    color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
                  ),
                ),
              ),
              child: Column(
                children: [
                  // Text Input Row
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _messageController,
                          decoration: const InputDecoration(
                            hintText: 'Ask your question here...',
                          ),
                          onSubmitted: (_) => _sendMessage(),
                          maxLines: null,
                        ),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: _sendMessage,
                        child: const Text('Send'),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 12),
                  
                  // Voice Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: _toggleVoiceInput,
                      icon: Icon(
                        _isVoiceActive ? Icons.stop : Icons.mic,
                        color: _isVoiceActive ? Colors.red : null,
                      ),
                      label: Text(
                        _isVoiceActive ? 'Recording... (Simulated)' : 'Voice Input',
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _isVoiceActive 
                            ? Colors.red 
                            : Theme.of(context).colorScheme.secondary,
                        foregroundColor: _isVoiceActive 
                            ? Colors.white 
                            : Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 12),
                  
                  // Suggested Questions
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _buildSuggestionChip('പാടി കൃഷി'),
                      _buildSuggestionChip('തെങ്ങ് രോഗം'),
                      _buildSuggestionChip('weather paddy'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildChatMessage(String message, String sender) {
    final isUser = sender == 'user';
    
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.8,
        ),
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isUser 
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          message,
          style: TextStyle(
            color: isUser 
                ? Theme.of(context).colorScheme.onPrimary
                : Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    );
  }

  Widget _buildTypingIndicator() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('AI is thinking'),
            const SizedBox(width: 8),
            SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSuggestionChip(String text) {
    return ActionChip(
      label: Text(text),
      onPressed: () => _askPredefinedQuestion(text),
      backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
      side: BorderSide(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
      ),
    );
  }
}
