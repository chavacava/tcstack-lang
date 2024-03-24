import type { ValidationAcceptor, ValidationChecks } from 'langium';
import type { TcStackAstType, Send } from './generated/ast.js';
import type { TcStackServices } from './tc-stack-module.js';

/**
 * Register custom validation checks.
 */
export function registerValidationChecks(services: TcStackServices) {
    const registry = services.validation.ValidationRegistry;
    const validator = services.validation.TcStackValidator;
    const checks: ValidationChecks<TcStackAstType> = {
        Send: validator.checkSendInstruction
    };
    registry.register(checks, validator);
}

/**
 * Implementation of custom validations.
 */
export class TcStackValidator {

    checkSendInstruction(sendInstruction: Send, accept: ValidationAcceptor): void {
                    accept('warning', 'Command name in unknown.', { node: sendInstruction });
    }

}
